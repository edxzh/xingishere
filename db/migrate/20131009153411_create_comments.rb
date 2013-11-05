class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :content,    limit: 160, null:false
      t.integer :blog_id
      t.integer :user_id
      t.integer :pid
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
