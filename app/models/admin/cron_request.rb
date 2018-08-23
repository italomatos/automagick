require 'net/https'
require 'json'
require 'logger'

class Admin::CronRequest < ApplicationRecord
	has_many :cron_request_logs
	after_save :update_whenever_file

	validates :title, presence: true
	validates :url, presence: true
	validates :http_method, presence: true

	def run!
		logger = Logger.new(STDOUT) 
		uri = URI(self.url)
		
		http = Net::HTTP.new uri.host, uri.port

		request = Net::HTTP::Post.new(uri.request_uri)

		if self.http_method == "GET"
			request = Net::HTTP::Get.new(uri.request_uri)
		elsif self.http_method == "POST"
			request = Net::HTTP::Post.new(uri.request_uri)
		else
			logger.info("No method error!")
		end

		request.set_form_data(JSON.parse(self.params)) if not self.params.blank?

		http.read_timeout = 200
		http.use_ssl = true if self.url.include? "https"
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	  begin
	    response = http.request(request)
	    responseMessage =  response.body
	    responseCode = response.code.to_i
	  rescue Exception => e 
	    responseMessage = e.message
	    responseCode = -1
	  end
		Admin::CronRequestLog.create({cron_request_id: self.id, status_code: responseCode, response:responseMessage})
	end

	def parse_to_whenever
	    hour = ""
	    hour = ", :at => '#{self.at}' " if not self.at.blank?
	<<-DOC
	every #{self.periodicity}.#{self.periodicity_type}#{hour} do 
	  runner "Admin::CronRequest.find(#{self.id}).run!"
	end	

	DOC

	end

	def update_whenever_file
	  	File.open('./config/schedule.rb', 'w+') do |f|
	  		f.puts "set :output, './log/automagick.cron.log'"
	  		Admin::CronRequest.where("status = 1").each do |cron_request|
	  			f.puts cron_request.parse_to_whenever
	  		end
	  	end

	  	`whenever --update-crontab automagick.coredigital.com.br_production`
	end
end
