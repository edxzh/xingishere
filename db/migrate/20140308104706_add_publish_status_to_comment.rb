class AddPublishStatusToComment < ActiveRecord::Migration
  def change
    add_column :comments, :publish_status, :boolean, null: false, default: true
  end
end
