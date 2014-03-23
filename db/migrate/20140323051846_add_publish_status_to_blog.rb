class AddPublishStatusToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :publish_status, :boolean, null: false,  default: true
  end
end
