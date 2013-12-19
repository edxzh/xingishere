class CreateUserLoves < ActiveRecord::Migration
  def change
    create_table :user_loves do |t|
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
