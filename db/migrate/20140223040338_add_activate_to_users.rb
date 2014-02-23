class AddActivateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :activate_code, :string
    add_column :users, :activate_status, :boolean, null: false, default: false
  end
end
