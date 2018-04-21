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

ActiveRecord::Schema.define(version: 20180421202233) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pipe_descrs", force: :cascade do |t|
    t.integer "diameter"
    t.float "wall_thickness"
    t.float "price"
    t.integer "pipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipe_id"], name: "index_pipe_descrs_on_pipe_id"
  end

  create_table "pipes", force: :cascade do |t|
    t.string "title"
    t.integer "category_id"
    t.string "img_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_pipes_on_category_id"
  end

  create_table "radiator_descrs", force: :cascade do |t|
    t.string "height"
    t.string "length"
    t.string "weight"
    t.float "price"
    t.integer "radiator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["radiator_id"], name: "index_radiator_descrs_on_radiator_id"
  end

  create_table "radiators", force: :cascade do |t|
    t.string "title"
    t.integer "category_id"
    t.string "img_src"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_radiators_on_category_id"
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer "category_id"
    t.integer "product_id"
    t.integer "product_item_id"
    t.integer "amount"
    t.float "price"
    t.integer "shopping_cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shopping_cart_id"], name: "index_shopping_cart_items_on_shopping_cart_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer "customer_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_shopping_carts_on_customer_id"
  end

  create_table "valve_descrs", force: :cascade do |t|
    t.float "radius"
    t.float "pressure"
    t.float "max_temperature"
    t.integer "valve_id"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["valve_id"], name: "index_valve_descrs_on_valve_id"
  end

  create_table "valves", force: :cascade do |t|
    t.string "title"
    t.string "img_src"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_valves_on_category_id"
  end

end
