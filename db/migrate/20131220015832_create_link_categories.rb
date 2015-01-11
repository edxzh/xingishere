# encoding: utf-8
class CreateLinkCategories < ActiveRecord::Migration
  def change
    create_table :link_categories, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '友链类型表' do |t|
      t.string :category,   limit: 100, null: false,      comment: "类型名"
      t.timestamps
    end
  end
end
