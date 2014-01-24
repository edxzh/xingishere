class Comment < ActiveRecord::Base
  attr_accessible :content, :blog_id, :user_id, :pid
  belongs_to :user

  validates :user,      presence: true
  validates :blog_id,   presence: true
end
