class Comment < ActiveRecord::Base
  attr_accessible :content, :blog_id, :user_id, :pid
  belongs_to :user
end
