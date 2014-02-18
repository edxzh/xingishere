class AddPublishStatusToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :publish_status, :boolean, null:  false,  default: true
  end
end
