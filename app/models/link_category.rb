class LinkCategory < ActiveRecord::Base
  attr_accessible :category, :link_id
  has_many  :links
end
