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

ActiveRecord::Schema.define(version: 20130905204442) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: true do |t|
    t.integer "subscriber_id"
    t.integer "tag_id"
    t.integer "score_threshold", default: 80
  end

  add_index "favorites", ["subscriber_id", "tag_id"], name: "index_favorites_on_subscriber_id_and_tag_id", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.text     "href"
    t.integer  "score"
    t.string   "user"
    t.string   "user_href"
    t.integer  "comments_count"
    t.integer  "hn_post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "submission"
  end

  add_index "posts", ["created_at"], name: "index_posts_on_created_at", using: :btree
  add_index "posts", ["id"], name: "index_posts_on_id", using: :btree
  add_index "posts", ["updated_at"], name: "index_posts_on_updated_at", using: :btree

  create_table "posts_subscribers", force: true do |t|
    t.integer "post_id"
    t.integer "subscriber_id"
  end

  add_index "posts_subscribers", ["post_id", "subscriber_id"], name: "index_posts_subscribers_on_post_id_and_subscriber_id", unique: true, using: :btree

  create_table "posts_tags", force: true do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "posts_tags", ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", unique: true, using: :btree

  create_table "subscribers", force: true do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribers", ["email"], name: "index_subscribers_on_email", unique: true, using: :btree
  add_index "subscribers", ["id"], name: "index_subscribers_on_id", using: :btree
  add_index "subscribers", ["reset_password_token"], name: "index_subscribers_on_reset_password_token", unique: true, using: :btree
  add_index "subscribers", ["uid"], name: "index_subscribers_on_uid", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["id"], name: "index_tags_on_id", using: :btree
  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

end
