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

ActiveRecord::Schema.define(version: 2021_09_09_085328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "distributors", force: :cascade do |t|
    t.string "name"
    t.string "license"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_distributors_on_users_id"
  end

  create_table "manufactors", force: :cascade do |t|
    t.string "name"
    t.string "license"
    t.string "address"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "distributor_id", null: false
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_manufactors_on_users_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.string "molecule"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "batch_no"
    t.integer "exp_date"
    t.integer "manf_date"
    t.bigint "manufactors_id", null: false
    t.index ["manufactors_id"], name: "index_medicines_on_manufactors_id"
  end

  create_table "medstores", force: :cascade do |t|
    t.string "name"
    t.string "license"
    t.integer "number"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_medstores_on_users_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "orders_id", null: false
    t.bigint "medicines_id", null: false
    t.index ["medicines_id"], name: "index_order_items_on_medicines_id"
    t.index ["orders_id"], name: "index_order_items_on_orders_id"
  end

  create_table "order_items_orders", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "order_item_id", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "medstores_id", null: false
    t.bigint "distributors_id", null: false
    t.index ["distributors_id"], name: "index_orders_on_distributors_id"
    t.index ["medstores_id"], name: "index_orders_on_medstores_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "quantity"
    t.bigint "distributors_id", null: false
    t.bigint "medicines_id", null: false
    t.index ["distributors_id"], name: "index_stocks_on_distributors_id"
    t.index ["medicines_id"], name: "index_stocks_on_medicines_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "detail_type"
    t.boolean "is_active", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "distributors", "users", column: "users_id"
  add_foreign_key "manufactors", "users", column: "users_id"
  add_foreign_key "medicines", "manufactors", column: "manufactors_id"
  add_foreign_key "medstores", "users", column: "users_id"
  add_foreign_key "order_items", "medicines", column: "medicines_id"
  add_foreign_key "order_items", "orders", column: "orders_id"
  add_foreign_key "orders", "distributors", column: "distributors_id"
  add_foreign_key "orders", "medstores", column: "medstores_id"
  add_foreign_key "stocks", "distributors", column: "distributors_id"
  add_foreign_key "stocks", "medicines", column: "medicines_id"
end
