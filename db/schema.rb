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

ActiveRecord::Schema.define(version: 20160203044921) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "image_path"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "career_passing_stats", force: :cascade do |t|
    t.date     "year"
    t.string   "team"
    t.integer  "games_played"
    t.integer  "completions"
    t.integer  "passing_attempts"
    t.integer  "passing_yards"
    t.integer  "passing_touchdowns"
    t.integer  "three_hundred_plus"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.decimal  "fantasy_points"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "player_id"
    t.integer  "interceptions"
  end

  add_index "career_passing_stats", ["player_id"], name: "index_career_passing_stats_on_player_id"

  create_table "career_receiving_stats", force: :cascade do |t|
    t.date     "year"
    t.string   "team"
    t.integer  "games_played"
    t.integer  "targets"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "hundred_plus"
    t.integer  "receiving_touchdowns"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.decimal  "fantasy_points"
    t.decimal  "ppr_fantasy_points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "player_id"
  end

  add_index "career_receiving_stats", ["player_id"], name: "index_career_receiving_stats_on_player_id"

  create_table "career_rushing_stats", force: :cascade do |t|
    t.date     "year"
    t.string   "team"
    t.integer  "games_played"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "hundred_plus"
    t.integer  "rushing_touchdowns"
    t.integer  "targets"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.decimal  "fantasy_points"
    t.decimal  "ppr_fantasy_points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "player_id"
  end

  add_index "career_rushing_stats", ["player_id"], name: "index_career_rushing_stats_on_player_id"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "passing_game_logs", force: :cascade do |t|
    t.integer  "week"
    t.date     "date"
    t.string   "opponent"
    t.integer  "completions"
    t.integer  "passing_attempts"
    t.integer  "passing_yards"
    t.integer  "passing_touchdowns"
    t.integer  "interceptions"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.decimal  "fantasy_points"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "player_id"
    t.integer  "season"
  end

  add_index "passing_game_logs", ["player_id"], name: "index_passing_game_logs_on_player_id"

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "college"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "team_id"
    t.string   "image_path"
    t.string   "position"
    t.date     "date_of_birth"
    t.string   "height"
    t.integer  "weight"
  end

  add_index "players", ["team_id"], name: "index_players_on_team_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "topic_id"
    t.float    "rank"
  end

  add_index "posts", ["topic_id"], name: "index_posts_on_topic_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "receiving_game_logs", force: :cascade do |t|
    t.integer  "season"
    t.integer  "week"
    t.date     "date"
    t.string   "opponent"
    t.integer  "targets"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.decimal  "fantasy_points"
    t.decimal  "ppr_fantasy_points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "player_id"
  end

  add_index "receiving_game_logs", ["player_id"], name: "index_receiving_game_logs_on_player_id"

  create_table "rushing_game_logs", force: :cascade do |t|
    t.integer  "season"
    t.integer  "week"
    t.date     "date"
    t.string   "opponent"
    t.integer  "rushing_attempts"
    t.integer  "rushing_yards"
    t.integer  "rushing_touchdowns"
    t.integer  "receptions"
    t.integer  "receiving_yards"
    t.integer  "receiving_touchdowns"
    t.decimal  "fantasy_points"
    t.decimal  "ppr_fantasy_points"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "player_id"
    t.integer  "targets"
  end

  add_index "rushing_game_logs", ["player_id"], name: "index_rushing_game_logs_on_player_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_path"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_path"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["post_id"], name: "index_votes_on_post_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
