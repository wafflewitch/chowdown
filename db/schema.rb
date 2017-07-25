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

ActiveRecord::Schema.define(version: 20170725140600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string   "name"
    t.integer  "count"
    t.string   "category"
    t.integer  "level"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_badges_on_user_id", using: :btree
  end

  create_table "calendars", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "dates",      default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "chow_id"
    t.index ["user_id"], name: "index_calendars_on_user_id", using: :btree
  end

  create_table "chows", force: :cascade do |t|
    t.date     "date"
    t.string   "status"
    t.string   "location"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_1_id"
    t.integer  "user_2_id"
    t.integer  "calendar_1_id"
    t.integer  "calendar_2_id"
  end

  create_table "decisions", force: :cascade do |t|
    t.integer  "user_1_id"
    t.integer  "user_2_id"
    t.boolean  "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_1_id"], name: "index_decisions_on_user_1_id", using: :btree
    t.index ["user_2_id"], name: "index_decisions_on_user_2_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "chow_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.index ["chow_id"], name: "index_messages_on_chow_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.date     "birthday"
    t.integer  "age"
    t.text     "bio"
    t.string   "job"
    t.string   "gender"
    t.string   "pref_meat"
    t.string   "pref_fish"
    t.string   "pref_wheat"
    t.string   "tag1"
    t.string   "tag2"
    t.string   "tag3"
    t.string   "tag4"
    t.string   "tag5"
    t.text     "address"
    t.integer  "max_distance"
    t.integer  "min_age"
    t.integer  "max_age"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "badges", "users"
  add_foreign_key "calendars", "users"
  add_foreign_key "decisions", "users", column: "user_1_id"
  add_foreign_key "decisions", "users", column: "user_2_id"
  add_foreign_key "messages", "chows"
end
