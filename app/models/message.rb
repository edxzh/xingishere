# encoding : utf-8
class Message < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to  :user
  validates   :content,     presence: true

  default_scope -> { order('created_at DESC') }

  def name
    if self.user_id
      User.find(self.user_id).name
    else
      "匿名用户"
    end
  end
end
