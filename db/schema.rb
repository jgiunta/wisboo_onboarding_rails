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

ActiveRecord::Schema.define(version: 20220419133016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "image"
    t.integer  "quantity"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_products", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_products", ["product_id"], name: "index_user_products_on_product_id", using: :btree
  add_index "user_products", ["user_id", "product_id"], name: "index_user_products_on_user_id_and_product_id", unique: true, using: :btree
  add_index "user_products", ["user_id"], name: "index_user_products_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "last_name"
    t.string  "email"
    t.integer "role"
    t.string  "password_digest"
  end

  add_foreign_key "user_products", "products"
  add_foreign_key "user_products", "users"
end
