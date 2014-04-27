# encoding: utf-8
class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :title,        limit:30,   null: false, default: "我的日志"
      t.text :content,                    null: false
      t.integer :user_id,                 null: false, default: ""
      t.string :tag
      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
