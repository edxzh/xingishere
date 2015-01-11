# encoding: utf-8
class CreateBlogCategories < ActiveRecord::Migration
  def change
    create_table :blog_categories, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '博客分类表' do |t|
      t.string :name,   limit: 25,  null: false,      comment: "类型名"

      t.timestamps
    end
  end
end
