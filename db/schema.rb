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

ActiveRecord::Schema.define(version: 20170920145546) do

  create_table "cities", force: :cascade do |t|
    t.integer "region_id"
    t.string "title_en"
    t.string "title_ru"
    t.string "title_be"
    t.string "title_fr"
    t.string "title_de"
    t.string "title_es"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.integer "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "title_en"
    t.string "title_ru"
    t.string "title_be"
    t.string "title_fr"
    t.string "title_de"
    t.string "title_es"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pet_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "pet_id"
    t.integer "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pet_photos", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.integer "subspecies"
    t.date "birthday"
    t.string "name"
    t.boolean "euthanasia", default: false
    t.date "euthanasia_date"
    t.integer "size"
    t.integer "gender"
    t.boolean "vaccination"
    t.text "diseases"
    t.boolean "sterilization"
    t.string "color"
    t.string "avatar"
    t.text "about"
    t.integer "user_id"
    t.integer "shelter_id"
    t.integer "cover"
    t.boolean "finished"
    t.string "finished_description"
    t.integer "views", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_images", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "visibility", default: true
    t.boolean "verified", default: false
    t.integer "views", default: 0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.integer "country_id"
    t.string "title_en"
    t.string "title_ru"
    t.string "title_be"
    t.string "title_fr"
    t.string "title_de"
    t.string "title_es"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "shelter_id"
    t.integer "day_of_week"
    t.time "open"
    t.time "close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shelter_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shelter_id"
    t.integer "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shelter_photos", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "shelter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shelter_staffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "shelter_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shelters", force: :cascade do |t|
    t.string "title"
    t.integer "country_id"
    t.integer "region_id"
    t.integer "city_id"
    t.string "street"
    t.string "house_number"
    t.float "latitude"
    t.float "longitude"
    t.text "about"
    t.string "cover"
    t.boolean "working"
    t.boolean "verified"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_networks", force: :cascade do |t|
    t.string "title"
    t.string "logotype"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_pages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "network_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "role_id", default: 1
    t.boolean "email_visible", default: false
    t.string "avatar"
    t.string "status"
    t.string "fullname"
    t.string "username"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
