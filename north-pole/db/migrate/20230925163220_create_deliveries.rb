class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :manifest
      t.datetime :delivery_date
      t.integer :customer_id
      t.integer :assigned_to_id
      t.integer :destination_id
      t.boolean :is_complete

      t.timestamps
    end
  end
end
