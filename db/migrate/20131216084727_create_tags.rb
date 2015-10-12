# encoding: utf-8
class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '博客标签表' do |t|
      t.integer :blog_id,                 null: false, default: 0,    comment: "博客ID"
      t.string :name,       limit: 20,    null: false, default: "",   comment: "标签名"

      t.timestamps
    end
  end
end
