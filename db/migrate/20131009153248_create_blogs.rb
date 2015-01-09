# encoding: utf-8
class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '博客表' do |t|
      t.string :title,        limit:30,   null: false, default: "我的日志", comment: "标题"
      t.text :content,                    null: false,                      comment: "内容"
      t.integer :user_id,                 null: false, default: 0,          comment: "用户ID"
      t.string :tag,                                                        comment: "标签"
      t.timestamps
    end
  end
end
