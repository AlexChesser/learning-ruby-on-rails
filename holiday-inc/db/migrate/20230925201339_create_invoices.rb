class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.integer :delivery_id
      t.decimal :amount, precision: 8, scale: 2

      t.timestamps
    end
  end
end
