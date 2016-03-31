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

ActiveRecord::Schema.define(version: 20160328133009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "image"
    t.text     "description"
    t.integer  "order"
    t.string   "theta_url"
    t.integer  "room_id"
    t.boolean  "cover",          default: false
    t.string   "token"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "attachments", ["imageable_type", "imageable_id"], name: "index_attachments_on_imageable_type_and_imageable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "city"
    t.string   "address"
    t.integer  "price"
    t.text     "description"
    t.integer  "state",             default: 0
    t.integer  "availability",      default: 0
    t.integer  "post_type",         default: 0
    t.integer  "author_id"
    t.string   "token"
    t.integer  "attachments_count", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "name"
    t.string   "image"
    t.string   "cover"
    t.string   "contact"
    t.string   "email",              default: "", null: false
    t.string   "encrypted_password", default: "", null: false
    t.integer  "sign_in_count",      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "posts_count",        default: 0
  end

end
