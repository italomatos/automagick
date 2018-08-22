class Admin::CronRequest < ApplicationRecord
	has_many :cron_request_logs
	after_save :update_whenever_file


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
