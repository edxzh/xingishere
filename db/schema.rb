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

ActiveRecord::Schema.define(:version => 20150105084929) do

  create_table "blog_categories", :force => true do |t|
    t.string   "name"
    t.integer  "blog_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blogs", :force => true do |t|
    t.string   "title",            :limit => 30,  :default => "我的日志", :null => false
    t.text     "content",                                             :null => false
    t.integer  "user_id",                                             :null => false
    t.string   "tag"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.integer  "blog_category_id"
    t.integer  "view_total",                      :default => 0,      :null => false
    t.integer  "weight",                          :default => 0,      :null => false
    t.boolean  "publish_status",                  :default => true,   :null => false
    t.string   "seo_keyword",      :limit => 100, :default => "",     :null => false
    t.string   "url_name",         :limit => 50,  :default => "",     :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content",        :limit => 255,                   :null => false
    t.integer  "blog_id"
    t.integer  "user_id"
    t.integer  "pid"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.boolean  "publish_status",                :default => true, :null => false
  end

  create_table "link_categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  create_table "links", :force => true do |t|
    t.string   "title",            :limit => 20,  :null => false
    t.string   "href",                            :null => false
    t.text     "description",      :limit => 255
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "link_category_id"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id"
    t.text     "content",                          :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "publish_status", :default => true, :null => false
  end

  create_table "subscribes", :force => true, :comment => "邮件订阅每周精选" do |t|
    t.string   "email",      :limit => 40, :default => "", :null => false, :comment => "邮箱地址"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "tags", :force => true do |t|
    t.integer  "blog_id",                  :null => false
    t.string   "name",       :limit => 20, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "tips", :force => true do |t|
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_loves", :force => true do |t|
    t.integer  "user_id"
    t.integer  "blog_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 20
    t.string   "name",            :limit => 20,  :default => "星哥粉丝",       :null => false
    t.string   "password_digest"
    t.string   "sex"
    t.date     "birthday",                       :default => '1970-01-01', :null => false
    t.integer  "status",                         :default => 0,            :null => false
    t.integer  "height"
    t.string   "position"
    t.string   "address"
    t.integer  "relation",                       :default => 0,            :null => false
    t.string   "image"
    t.integer  "rights",                         :default => 2,            :null => false
    t.integer  "score",                          :default => 0,            :null => false
    t.text     "description",     :limit => 255
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.string   "email"
    t.boolean  "admin",                          :default => false
    t.string   "activate_code"
    t.boolean  "activate_status",                :default => false,        :null => false
    t.string   "remember_token",                                           :null => false, :comment => "cookie记忆权标"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
