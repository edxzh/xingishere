# encoding : utf-8
class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8', comment: '友情链接表' do |t|
      t.string :title,                limit: 20,  null: false, default: "",     comment: "标题"
      t.string :href,                 limit: 50,  null: false, default: "",     comment: "链接"
      t.text :description,            limit: 100,                               comment: "描述"

      t.timestamps
    end
  end
end
