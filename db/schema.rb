# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130910221154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: true do |t|
    t.string   "name"
    t.integer  "elo"
    t.integer  "wins"
    t.integer  "losses"
    t.boolean  "gets_hitboxed"
    t.boolean  "undersized_hitbox"
    t.boolean  "oversized_hitbox"
    t.boolean  "zoning"
    t.boolean  "rushdown"
    t.boolean  "one_hit_knockout"
    t.boolean  "doesnt_super"
    t.boolean  "high_health"
    t.boolean  "low_health"
    t.boolean  "high_damage"
    t.boolean  "low_damage"
    t.boolean  "grappler"
    t.boolean  "grapple_immune"
    t.boolean  "flies"
    t.boolean  "heals"
    t.boolean  "timescammer"
    t.boolean  "has_fakes"
    t.boolean  "bad_ai"
    t.integer  "aggression_index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "champions_fights", force: true do |t|
    t.integer "fight_id"
    t.integer "champion_id"
  end

  create_table "fights", force: true do |t|
    t.datetime "time"
    t.integer  "bets_one"
    t.integer  "bets_two"
    t.integer  "winner"
    t.integer  "bet_count"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
