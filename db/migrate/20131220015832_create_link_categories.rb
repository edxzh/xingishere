class CreateLinkCategories < ActiveRecord::Migration
  def change
    create_table :link_categories do |t|
      t.string :category
      t.integer :link_id

      t.timestamps
    end
  end
end
