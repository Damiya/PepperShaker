class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :user
      t.string :text
      t.datetime :posted_at

      t.timestamps
    end
  end
end
