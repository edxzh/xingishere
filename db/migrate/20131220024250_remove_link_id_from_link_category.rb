class RemoveLinkIdFromLinkCategory < ActiveRecord::Migration
  def up
    remove_column :link_categories, :link_id
  end

  def down
    add_column :link_categories, :link_id, :integer
  end
end
