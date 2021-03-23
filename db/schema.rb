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

ActiveRecord::Schema.define(version: 2021_03_23_153911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_attendees_on_event_id"
    t.index ["friend_id"], name: "index_attendees_on_friend_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.bigint "movie_id"
    t.integer "duration"
    t.date "date"
    t.time "time"
    t.bigint "host_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["host_id"], name: "index_events_on_host_id"
    t.index ["movie_id"], name: "index_events_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.integer "api_movie_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_friends", force: :cascade do |t|
    t.bigint "sender_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_user_friends_on_receiver_id"
    t.index ["sender_id"], name: "index_user_friends_on_sender_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendees", "events"
  add_foreign_key "attendees", "users", column: "friend_id"
  add_foreign_key "events", "movies"
  add_foreign_key "events", "users", column: "host_id"
  add_foreign_key "user_friends", "users", column: "receiver_id"
  add_foreign_key "user_friends", "users", column: "sender_id"
end
