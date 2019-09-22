# encoding: UTF-8
FactoryBot.define do
  factory :cron_request, class: Admin::CronRequest do
  	title { 'Primeiro Cron' }
  	http_method { 'get' }
    url { 'http://www.google.com.br' }
  end
end
