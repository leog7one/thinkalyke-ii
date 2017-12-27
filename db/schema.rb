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

ActiveRecord::Schema.define(version: 20171026044931) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.integer  "thought_id"
    t.integer  "thinker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "attendances", ["thinker_id"], name: "index_attendances_on_thinker_id", using: :btree
  add_index "attendances", ["thought_id"], name: "index_attendances_on_thought_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "thought_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "thinker_id"
  end

  add_index "comments", ["thinker_id"], name: "index_comments_on_thinker_id", using: :btree
  add_index "comments", ["thought_id"], name: "index_comments_on_thought_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "thinkers", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.boolean  "admin",                  default: false
  end

  add_index "thinkers", ["email"], name: "index_thinkers_on_email", unique: true, using: :btree
  add_index "thinkers", ["reset_password_token"], name: "index_thinkers_on_reset_password_token", unique: true, using: :btree

  create_table "thought_tags", force: :cascade do |t|
    t.integer  "thought_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "thought_tags", ["tag_id"], name: "index_thought_tags_on_tag_id", using: :btree
  add_index "thought_tags", ["thought_id"], name: "index_thought_tags_on_thought_id", using: :btree

  create_table "thoughts", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "venue"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "thinker_id"
    t.integer  "category_id"
    t.string   "image"
  end

  add_index "thoughts", ["category_id"], name: "index_thoughts_on_category_id", using: :btree
  add_index "thoughts", ["thinker_id"], name: "index_thoughts_on_thinker_id", using: :btree

  add_foreign_key "attendances", "thinkers"
  add_foreign_key "attendances", "thoughts"
  add_foreign_key "comments", "thinkers"
  add_foreign_key "comments", "thoughts"
  add_foreign_key "thought_tags", "tags"
  add_foreign_key "thought_tags", "thoughts"
  add_foreign_key "thoughts", "thinkers"
end
