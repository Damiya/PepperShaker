class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.string :name
      t.integer :elo
      t.integer :wins
      t.integer :losses
      t.boolean :gets_hitboxed
      t.boolean :undersized_hitbox
      t.boolean :oversized_hitbox
      t.boolean :zoning
      t.boolean :rushdown
      t.boolean :one_hit_knockout
      t.boolean :doesnt_super
      t.boolean :high_health
      t.boolean :low_health
      t.boolean :high_damage
      t.boolean :low_damage
      t.boolean :grappler
      t.boolean :grapple_immune
      t.boolean :flies
      t.boolean :heals
      t.boolean :timescammer
      t.boolean :has_fakes
      t.boolean :bad_ai
      t.integer :aggression_index

      t.timestamps
    end
  end
end
