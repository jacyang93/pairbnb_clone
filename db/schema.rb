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

ActiveRecord::Schema.define(version: 20170606023626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "token"
    t.string   "provider"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "num_of_guests"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["listing_id"], name: "index_bookings_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description"
    t.string   "address"
    t.integer  "number_of_rooms"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "max_guest"
    t.integer  "price"
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
    t.integer  "listing_id"
    t.index ["listing_id"], name: "index_photos_on_listing_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "name"
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.string   "gender"
    t.integer  "age"
    t.date     "birthday"
    t.integer  "access_level",                   default: 0
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "bookings", "listings"
  add_foreign_key "bookings", "users"
  add_foreign_key "listings", "users"
  add_foreign_key "photos", "listings"
end
