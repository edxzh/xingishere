# encoding: utf-8
class CreateUserLoves < ActiveRecord::Migration
  def change
    create_table :user_loves, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '用户喜爱博客中间表' do |t|
      t.integer :user_id,     null: false,    default: 0,   comment: "用户ID"
      t.integer :blog_id,     null: false,    default: 0,   comment: "博客ID"

      t.timestamps
    end
    add_index :user_loves,  :user_id
  end
end
