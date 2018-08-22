class Admin::CronRequest < ApplicationRecord
	has_many :cron_request_logs
end
