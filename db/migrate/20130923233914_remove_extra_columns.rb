class RemoveExtraColumns < ActiveRecord::Migration
  def up
    remove_column :champions, :gets_hitboxed
    remove_column :champions, :undersized_hitbox
    remove_column :champions, :oversized_hitbox
    remove_column :champions, :zoning
    remove_column :champions, :rushdown
    remove_column :champions, :one_hit_knockout
    remove_column :champions, :doesnt_super
    remove_column :champions, :high_health
    remove_column :champions, :low_health
    remove_column :champions, :high_damage
    remove_column :champions, :low_damage
    remove_column :champions, :grappler
    remove_column :champions, :grapple_immune
    remove_column :champions, :flies
    remove_column :champions, :heals
    remove_column :champions, :timescammer
    remove_column :champions, :has_fakes
    remove_column :champions, :bad_ai
  end

  def down
    add_column :champions, :gets_hitboxed, :integer
    add_column :champions, :undersized_hitbox, :integer
    add_column :champions, :oversized_hitbox, :integer
    add_column :champions, :zoning, :integer
    add_column :champions, :rushdown, :integer
    add_column :champions, :one_hit_knockout, :integer
    add_column :champions, :doesnt_super, :integer
    add_column :champions, :high_health, :integer
    add_column :champions, :low_health, :integer
    add_column :champions, :high_damage, :integer
    add_column :champions, :low_damage, :integer
    add_column :champions, :grappler, :integer
    add_column :champions, :grapple_immune, :integer
    add_column :champions, :flies, :integer
    add_column :champions, :heals, :integer
    add_column :champions, :timescammer, :integer
    add_column :champions, :has_fakes, :integer
    add_column :champions, :bad_ai, :integer
  end
end
