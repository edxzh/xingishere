class AddLinkCategoryIdToLink < ActiveRecord::Migration
  def change
    add_column :links, :link_category_id, :integer
  end
end
