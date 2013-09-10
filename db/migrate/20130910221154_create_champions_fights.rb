class CreateChampionsFights < ActiveRecord::Migration
  def change
    create_table :champions_fights do |t|
      t.belongs_to :fight
      t.belongs_to :champion
    end
  end
end
