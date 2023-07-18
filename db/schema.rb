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

ActiveRecord::Schema[7.0].define(version: 2023_07_17_085813) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "address"
    t.bigint "user_id", null: false
    t.bigint "resort_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resort_id"], name: "index_bookings_on_resort_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "resorts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "location"
    t.float "price"
    t.text "description"
    t.integer "guests_amount"
    t.string "image_url"
    t.index ["user_id"], name: "index_resorts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "resorts"
  add_foreign_key "bookings", "users"
  add_foreign_key "resorts", "users"
end
