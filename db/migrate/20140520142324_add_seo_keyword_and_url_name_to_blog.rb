class AddSeoKeywordAndUrlNameToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :seo_keyword, :string, null: false, default: "", limit: "100"
    add_column :blogs, :url_name, :string, null: false, default: "", limit: "50"
  end
end
