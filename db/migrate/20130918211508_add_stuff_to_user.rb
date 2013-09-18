class AddStuffToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, :default => false
    add_column :users, :username, :string, :null => false, :default => ""
    add_index :users, :username
  end
end
