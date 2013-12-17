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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131216084727) do

  create_table "blogs", :force => true do |t|
    t.string   "title",      :limit => 30, :default => "我的日志", :null => false
    t.text     "content",                                      :null => false
    t.integer  "user_id",                                      :null => false
    t.string   "category"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content",    :limit => 255, :null => false
    t.integer  "blog_id"
    t.integer  "user_id"
    t.integer  "pid"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "tags", :force => true do |t|
    t.integer  "blog_id",                  :null => false
    t.string   "name",       :limit => 20, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 20
    t.string   "password_digest"
    t.string   "name",            :limit => 20,  :default => "星哥粉丝", :null => false
    t.string   "sex"
    t.date     "birthday"
    t.string   "status",                         :default => "2",    :null => false
    t.integer  "height"
    t.string   "position"
    t.string   "address"
    t.string   "relation"
    t.string   "image"
    t.integer  "rights"
    t.integer  "score",                          :default => 0,      :null => false
    t.text     "description",     :limit => 255
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "email"
    t.boolean  "admin",                          :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
