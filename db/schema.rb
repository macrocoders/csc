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

ActiveRecord::Schema.define(version: 20170123064243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "additional_phone"
    t.string   "email"
    t.integer  "legal_status",                 default: 0
    t.boolean  "is_buyer"
    t.boolean  "is_supplier"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "city",             limit: 100
    t.string   "street",           limit: 100
    t.string   "hous",             limit: 20
    t.string   "flat",             limit: 20
  end

  create_table "equipment_types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "title"
    t.integer  "brand_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "equipment_type_id"
    t.index ["brand_id"], name: "index_models_on_brand_id", using: :btree
  end

  create_table "order_status_changes", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "previous_status"
    t.string   "status"
    t.integer  "originator_id"
    t.string   "originator_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["order_id"], name: "index_order_status_changes_on_order_id", using: :btree
  end

  create_table "order_transfers", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "source_location_id"
    t.integer  "destination_location_id"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["order_id"], name: "index_order_transfers_on_order_id", using: :btree
    t.index ["user_id"], name: "index_order_transfers_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "job_type",                  default: 0
    t.integer  "model_id"
    t.string   "imei"
    t.string   "serial_number"
    t.string   "defect"
    t.string   "completeness"
    t.string   "appearance"
    t.text     "description"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.string   "work_status"
    t.string   "payment_status"
    t.integer  "stock_location_id"
    t.integer  "current_stock_location_id"
    t.datetime "deleted_at"
    t.index ["client_id"], name: "index_orders_on_client_id", using: :btree
    t.index ["current_stock_location_id"], name: "index_orders_on_current_stock_location_id", using: :btree
    t.index ["model_id"], name: "index_orders_on_model_id", using: :btree
    t.index ["stock_location_id"], name: "index_orders_on_stock_location_id", using: :btree
  end

  create_table "stock_items", force: :cascade do |t|
    t.integer  "stock_location_id"
    t.integer  "count_on_hand",     default: 0
    t.datetime "deleted_at"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["stock_location_id"], name: "index_stock_items_on_stock_location_id", using: :btree
  end

  create_table "stock_locations", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active"
    t.integer  "user_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "is_engineer_stock", default: false
    t.index ["user_id"], name: "index_stock_locations_on_user_id", using: :btree
  end

  create_table "stock_movements", force: :cascade do |t|
    t.integer  "stock_item_id"
    t.integer  "quantity"
    t.integer  "originator_id"
    t.string   "originator_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["stock_item_id"], name: "index_stock_movements_on_stock_item_id", using: :btree
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
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "warehouses", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_warehouses_on_user_id", using: :btree
  end

  add_foreign_key "models", "brands"
  add_foreign_key "order_status_changes", "orders"
  add_foreign_key "order_transfers", "orders"
  add_foreign_key "order_transfers", "users"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "models"
  add_foreign_key "stock_items", "stock_locations"
  add_foreign_key "stock_locations", "users"
  add_foreign_key "stock_movements", "stock_items"
end
