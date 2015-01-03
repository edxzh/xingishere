# encoding : utf-8
class Comment < ActiveRecord::Base
  attr_accessible :content, :blog_id, :user_id, :pid, :publish_status
  belongs_to  :user
  belongs_to  :blog

  validates :user_id,       presence: true
  validates :blog_id,       presence: true

  scope :published, -> { where("publish_status = ?", Settings.publish_status.published) }

  class << self
    # def blog_has(blog_id)
    #   Comment.where(blog_id: blog_id)
    # end
  end

  def name
    if self.user_id != 0
      User.find(self.user_id).name
    else
      "匿名用户"
    end
  end
end
