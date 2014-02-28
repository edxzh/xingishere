# encoding : utf-8
class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title,                limit: 20,  null: false
      t.string :href,                             null: false
      t.string :category,                         null: false, default: "其它"
      t.text :description,            limit: 100

      t.timestamps
    end
  end
end
