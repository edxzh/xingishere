class CreateUserLoves < ActiveRecord::Migration
  def change
    create_table :user_loves do |t|
      t.integer :user_id,     null: false,    default: 0
      t.integer :blog_id,     null: false,    default: 0

      t.timestamps
    end
  end
end
