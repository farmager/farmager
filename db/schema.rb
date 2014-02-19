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

ActiveRecord::Schema.define(version: 20140218230724) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crops", force: true do |t|
    t.string   "crop_type"
    t.string   "variety"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "herbicides"
    t.string   "fungicides"
    t.integer  "actual_seeded"
    t.integer  "total_produced"
    t.integer  "yield"
    t.integer  "field_id"
    t.integer  "grade"
    t.integer  "nitrogen"
    t.integer  "phosphorous"
    t.integer  "potassium"
    t.integer  "sulfur"
    t.integer  "years"
    t.date     "date_seeded"
    t.integer  "fields_id"
  end

  add_index "crops", ["fields_id"], name: "index_crops_on_fields_id", using: :btree

  create_table "equipment", force: true do |t|
    t.string   "notes"
    t.integer  "user_id"
    t.string   "name"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.integer  "value"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "equipment", ["user_id", "created_at"], name: "index_equipment_on_user_id_and_created_at", using: :btree

  create_table "expenses", force: true do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "notes"
    t.string   "land_location"
    t.string   "land_name"
    t.string   "crop_type"
    t.string   "variety"
    t.date     "seeding_date"
    t.integer  "f_nitrogen"
    t.integer  "f_phosphorous"
    t.integer  "f_sulphur"
    t.integer  "f_potassium"
    t.string   "herbicides"
    t.string   "fungicides"
    t.integer  "seeded_acres"
    t.integer  "netyield"
    t.integer  "grade"
    t.integer  "production"
  end

  add_index "fields", ["user_id", "created_at"], name: "index_fields_on_user_id_and_created_at", using: :btree

  create_table "inventories", force: true do |t|
    t.string   "name"
    t.integer  "capacity"
    t.string   "commodity"
    t.string   "ticket_no"
    t.integer  "moisture_content"
    t.string   "notes"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventories", ["user_id", "created_at"], name: "index_inventories_on_user_id_and_created_at", using: :btree

  create_table "schedules", force: true do |t|
    t.integer  "user_id"
    t.integer  "year"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start"
    t.datetime "end"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
