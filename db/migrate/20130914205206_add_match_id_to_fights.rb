class AddMatchIdToFights < ActiveRecord::Migration
  def up
    add_column :fights, :match_id, :integer
    add_index :fights, :match_id, unique: true
  end
  def down
    remove_column :fights, :match_id, :integer
    remove_index :fights, :match_id
  end
end
