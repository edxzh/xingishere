class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :tag
end
