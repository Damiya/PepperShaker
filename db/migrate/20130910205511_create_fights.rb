class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.belongs_to :blue_champion
      t.belongs_to :red_champion
      t.integer :bets_red
      t.integer :bets_blue
      t.integer :bet_count
      t.integer :winner #1 for red, 2 for blue
      t.boolean :champions_updated

      t.timestamps
    end
  end
end
