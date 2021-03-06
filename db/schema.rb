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

ActiveRecord::Schema.define(version: 2018_08_03_094035) do

  create_table "items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "order_id"
    t.text "food"
    t.decimal "cost"
    t.boolean "has_paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_items_on_order_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "deadline"
    t.decimal "delivery_cost"
    t.integer "creator_id"
    t.integer "orderer_id"
    t.integer "deliverer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place_id"
    t.datetime "delivery_time"
    t.boolean "delivery_by_restaurant", default: false
    t.string "delivery_notification"
    t.integer "used_delivery_time_button"
    t.integer "used_ordered_button"
    t.string "deadline_notification"
    t.string "deadline_ord_deli_job"
    t.index ["creator_id"], name: "index_orders_on_creator_id"
    t.index ["deliverer_id"], name: "index_orders_on_deliverer_id"
    t.index ["orderer_id"], name: "index_orders_on_orderer_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "menu_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show", default: false
  end

  create_table "users", force: :cascade do |t|
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
    t.string "nickname"
    t.string "account_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
