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

ActiveRecord::Schema.define(version: 20151225081611) do

  create_table "fitorders", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "group_number"
    t.datetime "outdate"
    t.datetime "returndate"
    t.string   "bookinfo"
    t.text     "info"
    t.string   "persons_list"
    t.string   "comeinfo"
    t.string   "comeinfo_way"
    t.string   "goinfo"
    t.string   "goinfo_way"
    t.integer  "price1"
    t.integer  "price2"
    t.integer  "price3"
    t.integer  "price4"
    t.text     "customers_info"
    t.string   "tip"
    t.string   "recipient"
    t.integer  "current_collction"
    t.string   "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "packageorders", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "group_number"
    t.datetime "outdate"
    t.datetime "returndate"
    t.text     "travel_agency"
    t.string   "person_list"
    t.text     "travel_content"
    t.integer  "price1"
    t.integer  "price2"
    t.integer  "price3"
    t.integer  "price4"
    t.text     "out_tracffic"
    t.text     "return_tracffic"
    t.integer  "cost"
    t.boolean  "package_ornot",       default: false
    t.string   "sales"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "out_tracffic_way"
    t.string   "return_tracffic_way"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_info"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
