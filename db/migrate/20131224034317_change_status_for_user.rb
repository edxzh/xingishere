class ChangeStatusForUser < ActiveRecord::Migration
  def up
    change_column :users, :status, :integer
  end

  def down
    change_column :users, :status, :string
  end
end
