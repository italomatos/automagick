class CreateAdminCronRequestLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_cron_request_logs do |t|
      t.integer :cron_request_id
      t.integer :status_code
      t.text :response

      t.timestamps
    end
  end
end
