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

ActiveRecord::Schema.define(version: 20170604162028) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "address_type", default: 0
    t.string "street_address"
    t.bigint "zipcode_id"
    t.bigint "city_id"
    t.bigint "state_id"
    t.bigint "user_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
    t.index ["zipcode_id"], name: "index_addresses_on_zipcode_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "category_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_category_items_on_category_id"
    t.index ["item_id"], name: "index_category_items_on_item_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.integer "status", default: 0
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "item_id"
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "line_item_subtotal"
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status", default: 0
    t.datetime "paid_date"
    t.datetime "cancelled_date"
    t.datetime "completed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.integer "role", default: 0
  end

  create_table "zipcodes", force: :cascade do |t|
    t.integer "number"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "addresses", "states"
  add_foreign_key "addresses", "users"
  add_foreign_key "addresses", "zipcodes"
  add_foreign_key "category_items", "categories"
  add_foreign_key "category_items", "items"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
end
