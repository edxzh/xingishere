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

ActiveRecord::Schema.define(:version => 20140808090216) do

  create_table "blog_categories", :force => true, :comment => "博客分类表" do |t|
    t.string   "name",       :limit => 25, :null => false, :comment => "类型名"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "blogs", :force => true, :comment => "博客表" do |t|
    t.string   "title",            :limit => 30, :default => "我的日志", :null => false, :comment => "标题"
    t.text     "content",                                                            :comment => "内容"
    t.integer  "user_id",                        :default => 0,      :null => false, :comment => "用户ID"
    t.string   "tag",                                                                :comment => "标签"
    t.integer  "blog_category_id",                                   :null => false, :comment => "博客类型ID"
    t.integer  "view_total",                     :default => 0,      :null => false, :comment => "浏览数"
    t.integer  "weight",                         :default => 0,      :null => false, :comment => "权重"
    t.string   "seo_keyword",      :limit => 60, :default => "",     :null => false, :comment => "SEO关键词"
    t.string   "url_name",         :limit => 25, :default => "",     :null => false, :comment => "URL后缀"
    t.boolean  "publish_status",                 :default => true,   :null => false, :comment => "发布状态"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "blogs", ["user_id"], :name => "index_blogs_on_user_id"

  create_table "comments", :force => true, :comment => "博客评论表" do |t|
    t.text     "content",        :limit => 255,                                   :comment => "评论内容"
    t.integer  "blog_id",                       :default => 0,    :null => false, :comment => "博客ID"
    t.integer  "user_id",                       :default => 0,    :null => false, :comment => "用户ID"
    t.integer  "pid",                                                             :comment => "回复的评论ID"
    t.boolean  "publish_status",                :default => true, :null => false, :comment => "发布状态"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "link_categories", :force => true, :comment => "友链类型表" do |t|
    t.string   "category",   :limit => 100,                :null => false, :comment => "类型名"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.integer  "user_id",                   :default => 0, :null => false
  end

  create_table "links", :force => true, :comment => "友情链接表" do |t|
    t.string   "title",            :limit => 20,  :default => "", :null => false, :comment => "标题"
    t.string   "href",             :limit => 50,  :default => "", :null => false, :comment => "链接"
    t.text     "description",      :limit => 255,                                 :comment => "描述"
    t.integer  "link_category_id",                                :null => false, :comment => "友链类型ID"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "messages", :force => true, :comment => "网站评论表" do |t|
    t.integer  "user_id"
    t.text     "content",                                          :comment => "评论内容"
    t.boolean  "publish_status", :default => true, :null => false, :comment => "发布状态"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "subscribes", :force => true, :comment => "邮件订阅每周精选" do |t|
    t.string   "email",      :limit => 40, :default => "", :null => false, :comment => "邮箱地址"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "tags", :force => true, :comment => "博客标签表" do |t|
    t.integer  "blog_id",                  :default => 0,  :null => false, :comment => "博客ID"
    t.string   "name",       :limit => 20, :default => "", :null => false, :comment => "标签名"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "tips", :force => true, :comment => "小贴士" do |t|
    t.text     "content",    :limit => 255,                 :comment => "内容"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "user_loves", :force => true, :comment => "用户喜爱博客中间表" do |t|
    t.integer  "user_id",    :default => 0, :null => false, :comment => "用户ID"
    t.integer  "blog_id",    :default => 0, :null => false, :comment => "博客ID"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "user_loves", ["user_id"], :name => "index_user_loves_on_user_id"

  create_table "users", :force => true, :comment => "用户表" do |t|
    t.string   "username",        :limit => 20,                                            :comment => "用户名"
    t.string   "name",            :limit => 20,  :default => "星哥粉丝",       :null => false, :comment => "姓名"
    t.string   "password_digest",                                                          :comment => "加密后的密码"
    t.string   "sex",             :limit => 20,                                            :comment => "性别"
    t.string   "email",           :limit => 50,                            :null => false, :comment => "邮箱"
    t.date     "birthday",                       :default => '1970-01-01', :null => false, :comment => "生日"
    t.integer  "status",                         :default => 0,            :null => false, :comment => "婚姻情况"
    t.integer  "height",                                                                   :comment => "身高"
    t.string   "position",        :limit => 50,                                            :comment => "职业"
    t.string   "address",         :limit => 50,                                            :comment => "地址"
    t.integer  "relation",                       :default => 0,            :null => false, :comment => "与博主关系"
    t.string   "image",                                                                    :comment => "头像"
    t.integer  "rights",                         :default => 2,            :null => false, :comment => "权限"
    t.integer  "score",                          :default => 0,            :null => false, :comment => "积分"
    t.text     "description",     :limit => 255,                                           :comment => "个人描述"
    t.boolean  "admin",                                                                    :comment => "是否为管理员"
    t.string   "activate_code",   :limit => 65,                                            :comment => "激活校验码"
    t.boolean  "activate_status",                :default => false,        :null => false, :comment => "激活状态"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
