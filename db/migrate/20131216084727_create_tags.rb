class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :blog_id,                 null:false
      t.string :name,       limit: 20,    null:false

      t.timestamps
    end
  end
end
