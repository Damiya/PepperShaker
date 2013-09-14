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

ActiveRecord::Schema.define(version: 20130913123442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: true do |t|
    t.string   "name"
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
    t.integer  "total_bets"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "champions", ["name"], name: "index_champions_on_name", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.integer  "champion_id"
    t.integer  "user_id"
    t.string   "text"
    t.datetime "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fights", force: true do |t|
    t.integer  "blue_champion_id"
    t.integer  "red_champion_id"
    t.integer  "bets_red"
    t.integer  "bets_blue"
    t.integer  "bet_count"
    t.integer  "winner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
