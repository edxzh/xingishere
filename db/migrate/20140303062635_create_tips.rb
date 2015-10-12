# encoding: utf-8
class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips, options: "DEFAULT CHARSET=utf8", comment: '小贴士' do |t|
      t.text :content,  limit: 100,             comment: "内容"

      t.timestamps  null: false
    end
  end
end
