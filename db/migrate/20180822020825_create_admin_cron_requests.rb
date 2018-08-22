class CreateAdminCronRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_cron_requests do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :http_method
      t.string :periodicity
      t.string :at
      t.boolean :status
      t.integer :user_id
      t.string :params

      t.timestamps
    end
  end
end
