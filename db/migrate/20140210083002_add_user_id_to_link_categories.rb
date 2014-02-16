class AddUserIdToLinkCategories < ActiveRecord::Migration
  def change
    add_column :link_categories, :user_id, :integer
  end
end
