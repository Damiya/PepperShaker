class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.datetime :time
      t.integer :bets_one
      t.integer :bets_two
      t.integer :winner
      t.integer :bet_count
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
