# encoding: utf-8
class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes, options: "DEFAULT CHARSET=utf8", comment: '邮件订阅每周精选' do |t|
      t.string :email, limit: 40, null: false,  default: '',  comment: '邮箱地址'

      t.timestamps  null: false
    end
  end
end
