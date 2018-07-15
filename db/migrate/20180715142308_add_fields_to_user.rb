class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :fullname, :string
    add_column :users, :capacity, :integer, :default => 100
    add_column :users, :cost, :decimal, :default => 0
    add_column :users, :employee, :boolean, :default => true
    add_column :users, :active, :boolean, :default => true
    add_column :users, :image, :string
    add_column :users, :admin, :boolean
  end
end
