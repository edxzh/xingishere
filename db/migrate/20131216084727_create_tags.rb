class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :blog_id,                 null: false, default: 0
      t.string :name,       limit: 20,    null: false, default: ""

      t.timestamps
    end
  end
end
