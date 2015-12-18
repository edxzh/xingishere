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

ActiveRecord::Schema.define(version: 30140808090216) do

  create_table "blog_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "blog_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title",            limit: 30,    default: "我的日志", null: false
    t.text     "content",          limit: 65535,                  null: false
    t.integer  "user_id",          limit: 4,                      null: false
    t.string   "tag",              limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "blog_category_id", limit: 4
    t.integer  "view_total",       limit: 4,     default: 0,      null: false
    t.integer  "weight",           limit: 4,     default: 0,      null: false
    t.boolean  "publish_status",   limit: 1,     default: true,   null: false
    t.string   "seo_keyword",      limit: 100,   default: "",     null: false
    t.string   "url_name",         limit: 50,    default: "",     null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",        limit: 160
    t.integer  "blog_id",        limit: 4
    t.integer  "user_id",        limit: 4
    t.integer  "pid",            limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "publish_status", limit: 1,   default: true, null: false
    t.string   "remote_ip",      limit: 20,  default: "",   null: false, comment: ";IP"
    t.string   "nickname",       limit: 20,  default: "",   null: false
    t.string   "email",          limit: 50,  default: "",   null: false
  end

  create_table "link_categories", force: :cascade do |t|
    t.string   "category",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
  end

  create_table "links", force: :cascade do |t|
    t.string   "title",            limit: 20,  null: false
    t.string   "href",             limit: 255, null: false
    t.text     "description",      limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "link_category_id", limit: 4
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.text     "content",        limit: 65535,                null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "publish_status", limit: 1,     default: true, null: false
  end

  create_table "subscribes", force: :cascade do |t|
    t.string   "email",      limit: 40, default: "", null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "blog_id",    limit: 4,  null: false
    t.string   "name",       limit: 20, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "tips", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_loves", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "blog_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 20
    t.string   "name",            limit: 20,  default: "星哥粉丝",       null: false
    t.string   "password_digest", limit: 255
    t.string   "sex",             limit: 255
    t.date     "birthday",                    default: '1970-01-01', null: false
    t.integer  "status",          limit: 4,   default: 0,            null: false
    t.integer  "height",          limit: 4
    t.string   "position",        limit: 255
    t.string   "address",         limit: 255
    t.integer  "relation",        limit: 4,   default: 0,            null: false
    t.string   "image",           limit: 255
    t.integer  "rights",          limit: 4,   default: 2,            null: false
    t.integer  "score",           limit: 4,   default: 0,            null: false
    t.text     "description",     limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "email",           limit: 255
    t.boolean  "admin",           limit: 1,   default: false
    t.string   "activate_code",   limit: 255
    t.boolean  "activate_status", limit: 1,   default: false,        null: false
    t.string   "remember_token",  limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
