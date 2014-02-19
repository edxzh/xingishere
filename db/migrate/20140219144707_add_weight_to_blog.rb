class AddWeightToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :weight, :integer, null: false, default: 0
  end
end
