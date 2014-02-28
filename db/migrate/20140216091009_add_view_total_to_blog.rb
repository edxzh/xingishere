class AddViewTotalToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :view_total, :integer, null: false, default: 0
  end
end
