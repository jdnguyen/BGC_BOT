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

ActiveRecord::Schema.define(version: 20150816001863) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string   "name"
    t.integer  "min_player"
    t.integer  "max_player"
    t.string   "link"
    t.integer  "min_time"
    t.integer  "max_time"
    t.integer  "time_played", default: 0
    t.integer  "ranking"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "rules"
  end

  create_table "plays", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id",    null: false
  end

  add_index "plays", ["game_id"], name: "index_plays_on_game_id", using: :btree

  create_table "user_votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id",    null: false
    t.integer  "user_id",    null: false
    t.integer  "vote_id",    null: false
  end

  add_index "user_votes", ["game_id"], name: "index_user_votes_on_game_id", using: :btree
  add_index "user_votes", ["user_id"], name: "index_user_votes_on_user_id", using: :btree
  add_index "user_votes", ["vote_id"], name: "index_user_votes_on_vote_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_id",                    null: false
    t.boolean  "admin",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "game_id",    null: false
    t.integer  "user_id",    null: false
  end

  add_index "wins", ["game_id"], name: "index_wins_on_game_id", using: :btree
  add_index "wins", ["user_id"], name: "index_wins_on_user_id", using: :btree

end