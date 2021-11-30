# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_25_205154) do

  create_table "chat_room_teams", force: :cascade do |t|
    t.integer "teams_id"
    t.integer "chat_rooms_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chat_rooms_id"], name: "index_chat_room_teams_on_chat_rooms_id"
    t.index ["teams_id"], name: "index_chat_room_teams_on_teams_id"
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "teams_id"
    t.integer "scrims_id"
    t.integer "grade"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scrims_id"], name: "index_evaluations_on_scrims_id"
    t.index ["teams_id"], name: "index_evaluations_on_teams_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "users_id"
    t.integer "teams_id"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teams_id"], name: "index_favorites_on_teams_id"
    t.index ["users_id"], name: "index_favorites_on_users_id"
  end

  create_table "messages", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "content"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "chat_room_id"
    t.integer "team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.boolean "active"
    t.integer "teams_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teams_id"], name: "index_players_on_teams_id"
  end

  create_table "scrims", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.integer "level"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_scrims", force: :cascade do |t|
    t.integer "teams_id"
    t.integer "scrims_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scrims_id"], name: "index_team_scrims_on_scrims_id"
    t.index ["teams_id"], name: "index_team_scrims_on_teams_id"
  end

  create_table "teams", force: :cascade do |t|
    t.integer "users_id"
    t.string "name"
    t.integer "number_off_athletes"
    t.integer "level"
    t.float "grade"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["users_id"], name: "index_teams_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chat_room_teams", "chat_rooms", column: "chat_rooms_id"
  add_foreign_key "chat_room_teams", "teams", column: "teams_id"
  add_foreign_key "favorites", "teams", column: "teams_id"
  add_foreign_key "favorites", "users", column: "users_id"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "teams"
  add_foreign_key "players", "teams", column: "teams_id"
  add_foreign_key "team_scrims", "scrims", column: "scrims_id"
  add_foreign_key "team_scrims", "teams", column: "teams_id"
  add_foreign_key "teams", "users", column: "users_id"
end
