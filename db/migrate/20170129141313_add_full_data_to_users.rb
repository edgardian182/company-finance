class AddFullDataToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :city, :string
    add_column :users, :type, :integer
  end
end
