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

ActiveRecord::Schema.define(version: 2020_02_06_074557) do

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mecca_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mecca_id"], name: "index_favorites_on_mecca_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "mecca_comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mecca_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mecca_id"], name: "index_mecca_comments_on_mecca_id"
    t.index ["user_id"], name: "index_mecca_comments_on_user_id"
  end

  create_table "meccas", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "body"
    t.string "mecca_image_id"
    t.string "post_code"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meccas_movie_tags", force: :cascade do |t|
    t.integer "movie_tag_id", null: false
    t.integer "mecca_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mecca_id"], name: "index_meccas_movie_tags_on_mecca_id"
    t.index ["movie_tag_id"], name: "index_meccas_movie_tags_on_movie_tag_id"
  end

  create_table "movie_tags", force: :cascade do |t|
    t.string "title"
    t.string "movie_image_id"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_image_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
