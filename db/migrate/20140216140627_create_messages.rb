class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.text :content,                    null: false, default: ""

      t.timestamps
    end
  end
end
