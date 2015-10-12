# encoding: utf-8
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '网站评论表' do |t|
      t.integer :user_id
      t.text :content,                                          comment: "评论内容"
      t.boolean :publish_status,  null: false,  default: true,  comment: "发布状态"

      t.timestamps                null: false
    end
  end
end
