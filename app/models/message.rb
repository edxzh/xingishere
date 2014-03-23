# encoding : utf-8
class Message < ActiveRecord::Base
  attr_accessible :content, :user_id, :publish_status
  belongs_to  :user
  validates   :content,     presence: true

  scope :published, -> { where("publish_status = ?", Settings.publish_status.published) }
  default_scope -> { order('created_at DESC') }

  def name
    if self.user_id != 0
      User.find(self.user_id).name
    else
      "匿名用户"
    end
  end
end
