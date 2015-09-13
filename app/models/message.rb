# encoding : utf-8
class Message < ActiveRecord::Base
  belongs_to  :user
  validates   :content,     presence: true

  scope :published, -> { where("publish_status = ?", Settings.publish_status.published) }

  def name
    if self.user_id != 0
      User.find(self.user_id).name
    else
      "匿名用户"
    end
  end
end
