# encoding : utf-8
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string  :username,           limit: 20
      t.string  :name,               limit: 20,    null:false, default:"星哥粉丝"
      t.string  :password_digest
      t.string  :sex
      t.date    :birthday
      t.string  :status
      t.integer :height
      t.string  :position
      t.string  :address
      t.string  :relation
      t.string  :image
      t.integer :rights                           null:false, default:"2"
      t.integer :score,                           null:false, default:0
      t.text    :description,        limit:100
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
