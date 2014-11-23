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

ActiveRecord::Schema.define(version: 20141123204612) do

  create_table "artists", force: true do |t|
    t.string   "name"
    t.string   "artistpic"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "concerts", force: true do |t|
    t.string   "event"
    t.string   "venue"
    t.datetime "date"
    t.string   "link"
    t.string   "concertpic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id"
    t.string   "artists"
  end

  add_index "concerts", ["artist_id"], name: "index_concerts_on_artist_id"

  create_table "forecasts", force: true do |t|
    t.date     "date"
    t.string   "quality"
    t.integer  "surf_break_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spot"
    t.string   "height"
  end

  add_index "forecasts", ["surf_break_id"], name: "index_forecasts_on_surf_break_id"

  create_table "interests", force: true do |t|
    t.string   "title"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surf_break_locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surf_breaks", force: true do |t|
    t.string   "name"
    t.text     "mslink"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spot_id"
    t.string   "surfpic"
    t.integer  "surf_break_location_id"
  end

  add_index "surf_breaks", ["surf_break_location_id"], name: "index_surf_breaks_on_surf_break_location_id"

  create_table "user_concerts", force: true do |t|
    t.integer  "user_id"
    t.integer  "concert_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_concerts", ["concert_id"], name: "index_user_concerts_on_concert_id"
  add_index "user_concerts", ["user_id"], name: "index_user_concerts_on_user_id"

  create_table "user_interests", force: true do |t|
    t.boolean  "surfing"
    t.boolean  "concerts"
    t.boolean  "free_events"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "songkick"
  end

  add_index "user_interests", ["user_id"], name: "index_user_interests_on_user_id"

  create_table "user_surf_breaks", force: true do |t|
    t.integer  "user_id"
    t.integer  "surf_break_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_surf_breaks", ["surf_break_id"], name: "index_user_surf_breaks_on_surf_break_id"
  add_index "user_surf_breaks", ["user_id"], name: "index_user_surf_breaks_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "songkick_username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
