json.extract! admin_cron_request, :id, :title, :description, :url, :http_method, :periodicity, :at, :status, :user_id, :params, :created_at, :updated_at
json.url admin_cron_request_url(admin_cron_request, format: :json)
