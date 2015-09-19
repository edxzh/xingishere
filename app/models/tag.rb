class Tag < ActiveRecord::Base
  attr_accessible :blog_id, :name
  belongs_to  :blog
end
