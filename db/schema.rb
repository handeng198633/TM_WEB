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

ActiveRecord::Schema.define(version: 20151230031241) do

  create_table "finances", force: :cascade do |t|
    t.datetime "out_date"
    t.datetime "package_date"
    t.string   "content"
    t.string   "travel_agency"
    t.integer  "person_number"
    t.string   "price4_person"
    t.integer  "should"
    t.integer  "received"
    t.integer  "balance"
    t.string   "remark"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "finances", ["created_at"], name: "index_finances_on_created_at"

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

  create_table "linelists", force: :cascade do |t|
    t.integer  "line_id"
    t.string   "group_number"
    t.integer  "day"
    t.string   "linename"
    t.string   "line_info"
    t.text     "travel_content"
    t.text     "picture"
    t.text     "document"
    t.string   "price"
    t.string   "record_person"
    t.string   "selling_ornot"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "linelists", ["line_id", "created_at"], name: "index_linelists_on_line_id_and_created_at"

  create_table "netprofits", force: :cascade do |t|
    t.text     "month"
    t.integer  "total_income"
    t.integer  "total_coat"
    t.integer  "profit"
    t.integer  "fax"
    t.integer  "net_profit"
    t.boolean  "status",       default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "netprofits", ["month"], name: "index_netprofits_on_month", unique: true

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

  create_table "planestates", force: :cascade do |t|
    t.text     "stateinfo"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planetickets", force: :cascade do |t|
    t.string   "category"
    t.string   "order_id"
    t.string   "number"
    t.datetime "outdate"
    t.string   "travel_content"
    t.string   "combined_transport"
    t.datetime "ticketdate"
    t.string   "place"
    t.string   "person_name"
    t.string   "person_idcard"
    t.datetime "valid_date"
    t.datetime "born_date"
    t.integer  "ticket_cost"
    t.integer  "counter_cost"
    t.string   "plane"
    t.string   "remark"
    t.string   "record_person"
    t.string   "record_remark"
    t.boolean  "state",              default: false
    t.string   "state_step"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "planetickets", ["created_at"], name: "index_planetickets_on_created_at"

  create_table "returninfos", force: :cascade do |t|
    t.string   "category"
    t.string   "content"
    t.string   "remark"
    t.boolean  "state",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "returninfos", ["created_at"], name: "index_returninfos_on_created_at"

  create_table "salescounts", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.integer  "person_number"
    t.integer  "profit"
    t.integer  "received"
    t.integer  "noreceived"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "ticketstates", force: :cascade do |t|
    t.string   "stateinfo"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "traintickets", force: :cascade do |t|
    t.string   "category"
    t.string   "order_id"
    t.string   "number"
    t.datetime "outdate"
    t.string   "travel_content"
    t.string   "combined_transport"
    t.string   "place"
    t.string   "person_name"
    t.string   "person_idcard"
    t.string   "ticket_cost"
    t.string   "difficulty"
    t.string   "seat1"
    t.string   "seat2"
    t.string   "remark"
    t.string   "record_person"
    t.string   "record_remark"
    t.boolean  "state",              default: false
    t.string   "state_step"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "traintickets", ["created_at"], name: "index_traintickets_on_created_at"

  create_table "travelinfos", force: :cascade do |t|
    t.string   "category"
    t.string   "content"
    t.string   "remark"
    t.boolean  "state",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "travelinfos", ["created_at"], name: "index_travelinfos_on_created_at"

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
