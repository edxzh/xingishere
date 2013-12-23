class RemoveCategoryFromLink < ActiveRecord::Migration
  def up
    remove_column :links, :category
  end

  def down
    add_column :links, :category, :string
  end
end
