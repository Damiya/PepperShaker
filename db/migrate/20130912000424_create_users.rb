class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.datetime :last_login
      t.boolean :is_admin

      t.timestamps
    end
  end
end
