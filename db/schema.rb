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

ActiveRecord::Schema.define(version: 20151207092830) do

  create_table "fit_orders", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "group_number"
    t.datetime "outdate"
    t.datetime "returndate"
    t.string   "bookinfo"
    t.text     "info"
    t.string   "persons_list"
    t.text     "comeinfo"
    t.text     "goinfo"
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

  add_index "fit_orders", ["order_id", "created_at"], name: "index_fit_orders_on_order_id_and_created_at"

  create_table "line_lists", force: :cascade do |t|
    t.integer  "line_id"
    t.string   "group_number"
    t.integer  "day"
    t.string   "linename"
    t.string   "line_info"
    t.text     "travel_content"
    t.integer  "picture_id"
    t.integer  "document_id"
    t.string   "price"
    t.string   "record_person"
    t.string   "selling_ornot"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "line_lists", ["line_id", "created_at"], name: "index_line_lists_on_line_id_and_created_at"

  create_table "package_orders", force: :cascade do |t|
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
    t.string   "package_ornot"
    t.string   "sales"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "package_orders", ["order_id", "created_at"], name: "index_package_orders_on_order_id_and_created_at"

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
