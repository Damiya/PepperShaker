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

ActiveRecord::Schema.define(version: 20130918003849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champions", force: true do |t|
    t.string   "name"
    t.integer  "elo"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "total_bets"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gets_hitboxed"
    t.integer  "undersized_hitbox"
    t.integer  "oversized_hitbox"
    t.integer  "zoning"
    t.integer  "rushdown"
    t.integer  "one_hit_knockout"
    t.integer  "doesnt_super"
    t.integer  "high_health"
    t.integer  "low_health"
    t.integer  "high_damage"
    t.integer  "low_damage"
    t.integer  "grappler"
    t.integer  "grapple_immune"
    t.integer  "flies"
    t.integer  "heals"
    t.integer  "timescammer"
    t.integer  "has_fakes"
    t.integer  "bad_ai"
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
    t.integer  "match_id"
  end

  add_index "fights", ["match_id"], name: "index_fights_on_match_id", unique: true, using: :btree

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "remember_token"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
