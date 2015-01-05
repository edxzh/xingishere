# encoding: utf-8
class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string,  null: false,  comment: "cookie记忆权标"
    add_index :users, :remember_token
  end
end
