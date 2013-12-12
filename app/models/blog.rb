class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :tag
  belongs_to  :user
  validates :user_id,           presence: true
  validates :title,             presence: true

  default_scope -> { order('created_at DESC') }
end
