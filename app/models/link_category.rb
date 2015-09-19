class LinkCategory < ActiveRecord::Base
  attr_accessible :category, :link_id, :user_id
  has_many  :links
  belongs_to  :user
end
