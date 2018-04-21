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

ActiveRecord::Schema.define(version: 20180421003036) do

  create_table "activities", force: :cascade do |t|
    t.string "trackable_type"
    t.integer "trackable_id"
    t.string "owner_type"
    t.integer "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "cities", force: :cascade do |t|
    t.integer "region_id"
    t.integer "country_id"
    t.string "title"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "title"
    t.integer "lookup_code", default: 0
  end

  create_table "pet_photos", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.date "birthday"
    t.date "euthanasia"
    t.boolean "sterilization", default: false
    t.boolean "vaccination", default: false
    t.integer "subspecies", default: 0
    t.integer "size"
    t.integer "gender", default: 0
    t.integer "user_id"
    t.integer "shelter_id"
    t.string "name"
    t.string "color"
    t.string "avatar"
    t.text "diseases"
    t.text "about"
    t.integer "status", default: 0
    t.integer "views", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer "shelter_id"
    t.string "phone_number"
    t.string "name"
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
    t.string "title"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "shelter_id"
    t.integer "day_of_week"
    t.time "open"
    t.time "close"
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
    t.integer "role", default: 0
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
    t.float "latitude", default: 0.0
    t.float "longitude", default: 0.0
    t.text "about"
    t.string "cover"
    t.boolean "moderation", default: false
    t.boolean "verified", default: false
    t.integer "status", default: 0
    t.integer "user_id"
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
    t.integer "role", default: 0
    t.boolean "email_visible", default: false
    t.string "avatar"
    t.integer "status", default: 0
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
