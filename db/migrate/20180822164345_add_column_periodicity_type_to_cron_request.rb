class AddColumnPeriodicityTypeToCronRequest < ActiveRecord::Migration[5.2]
  def change
  	add_column :admin_cron_requests, :periodicity_type, :string
  end
end
