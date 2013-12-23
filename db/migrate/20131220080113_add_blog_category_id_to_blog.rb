class AddBlogCategoryIdToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :blog_category_id, :integer
  end
end
