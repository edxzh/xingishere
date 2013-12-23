class CreateBlogCategories < ActiveRecord::Migration
  def change
    create_table :blog_categories do |t|
      t.string :name
      t.integer :blog_id

      t.timestamps
    end
  end
end
