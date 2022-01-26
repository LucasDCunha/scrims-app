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

ActiveRecord::Schema.define(version: 2022_01_26_144704) do

  create_table "chat_rooms", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.integer "user_id"
    t.index ["team_id"], name: "index_chat_rooms_on_team_id"
    t.index ["user_id"], name: "index_chat_rooms_on_user_id"
  end

  create_table "complaints", force: :cascade do |t|
    t.string "message"
    t.integer "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_complaints_on_team_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "grade"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.integer "scrim_id"
    t.index ["scrim_id"], name: "index_evaluations_on_scrim_id"
    t.index ["team_id"], name: "index_evaluations_on_team_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.integer "user_id"
    t.index ["team_id"], name: "index_favorites_on_team_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "invite_teams", force: :cascade do |t|
    t.integer "team_id"
    t.integer "invite_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invite_id"], name: "index_invite_teams_on_invite_id"
    t.index ["team_id"], name: "index_invite_teams_on_team_id"
  end

  create_table "invites", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "content"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "chat_room_id"
    t.integer "user_id"
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.index ["team_id"], name: "index_players_on_team_id"
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id"
    t.integer "scrim_id"
    t.index ["scrim_id"], name: "index_team_scrims_on_scrim_id"
    t.index ["team_id"], name: "index_team_scrims_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "number_off_athletes"
    t.integer "level"
    t.float "grade"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
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

  add_foreign_key "complaints", "teams"
  add_foreign_key "invite_teams", "invites"
  add_foreign_key "invite_teams", "teams"
end
