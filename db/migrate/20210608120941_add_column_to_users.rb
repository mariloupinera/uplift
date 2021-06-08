class AddColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :skills, :string
    add_column :users, :description, :string
  end
end
