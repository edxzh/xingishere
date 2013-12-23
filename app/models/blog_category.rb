class BlogCategory < ActiveRecord::Base
  attr_accessible :blog_id, :name
  has_many  :blogs
end
