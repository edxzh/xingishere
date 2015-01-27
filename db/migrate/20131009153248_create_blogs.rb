# encoding: utf-8
class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '博客表' do |t|
      t.string :title,              limit: 30,   null: false,  default: "我的日志",  comment: "标题"
      t.text :content,                                                   comment: "内容"
      t.integer :user_id,                        null: false,  default: 0,           comment: "用户ID"
      t.string :tag,                                                                 comment: "标签"
      t.integer :blog_category_id,               null: false,                        comment: "博客类型ID"
      t.integer :view_total,                     null: false,  default: 0,           comment: "浏览数"
      t.integer :weight,                         null: false,  default: 0,           comment: "权重"
      t.string  :seo_keyword,       limit: 60,   null: false,  default: "",          comment: "SEO关键词"
      t.string  :url_name,          limit: 25,   null: false,  default: "",          comment: "URL后缀"
      t.boolean :publish_status,                 null: false,  default: true,        comment: "发布状态"
      t.timestamps
    end
    add_index :blogs,  :user_id
  end
end
