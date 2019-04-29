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

ActiveRecord::Schema.define(version: 20181113233054) do

  create_table "dater_matches", force: :cascade do |t|
    t.integer  "judger_id"
    t.integer  "judgee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "doeslike"
  end

  create_table "daters", force: :cascade do |t|
    t.string   "name"
    t.string   "username"
    t.string   "password"
    t.string   "phone_number"
    t.string   "gender"
    t.integer  "age"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "profpic_file_name"
    t.string   "profpic_content_type"
    t.integer  "profpic_file_size",    limit: 8
    t.datetime "profpic_updated_at"
  end

  add_index "daters", ["username"], name: "index_daters_on_username", unique: true

  create_table "daters_interests", id: false, force: :cascade do |t|
    t.integer "dater_id",    null: false
    t.integer "interest_id", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string   "interest_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
