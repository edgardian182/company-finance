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

ActiveRecord::Schema.define(version: 20170129130122) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "lastname"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "city"
    t.string   "reference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clients", ["user_id"], name: "index_clients_on_user_id"

  create_table "expenses", force: :cascade do |t|
    t.string   "concept"
    t.date     "date"
    t.decimal  "amount"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "type_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "product_id"
    t.float    "quantity"
    t.string   "measure"
    t.integer  "fund_id"
    t.string   "invoice_file_name"
    t.string   "invoice_content_type"
    t.integer  "invoice_file_size"
    t.datetime "invoice_updated_at"
    t.string   "material"
  end

  add_index "expenses", ["category_id"], name: "index_expenses_on_category_id"
  add_index "expenses", ["fund_id"], name: "index_expenses_on_fund_id"
  add_index "expenses", ["product_id"], name: "index_expenses_on_product_id"
  add_index "expenses", ["type_id"], name: "index_expenses_on_type_id"
  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id"

  create_table "funds", force: :cascade do |t|
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "materials", ["category_id"], name: "index_materials_on_category_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "state"
    t.date     "date"
    t.decimal  "amount"
    t.string   "reference"
    t.boolean  "paid"
    t.decimal  "debt"
    t.date     "delivered_date"
    t.date     "pay_date"
    t.integer  "client_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "orders", ["client_id"], name: "index_orders_on_client_id"

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "superadmin_role",        default: false
    t.boolean  "supervisor_role",        default: false
    t.boolean  "user_role",              default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
