# encoding: utf-8
class AddFieldsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :remote_ip, :string, limit: 20,  null: false,  default: '', comment: "评论者IP"
    add_column :comments, :nickname, :string,  limit: 20,  null: false,  default: '', comment: "昵称"
    add_column :comments, :email, :string,     limit: 50,  null: false,  default: '', comment: "电子邮箱"
  end
end
