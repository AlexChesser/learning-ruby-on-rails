class AddRelationsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :country_id, :integer
    add_column :users, :role_id, :integer
    add_column :users, :locale_id, :integer
  end
end
