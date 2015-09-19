class UserLove < ActiveRecord::Base
  attr_accessible :blog_id, :user_id
  validates :user_id,   presence: true
  validates :blog_id,   presence: true
  belongs_to :user
  belongs_to :blog

  class << self
    def add(user_id, blog_id)
      tmp = UserLove.where("user_id = ? AND blog_id = ?", user_id, blog_id).first
      if tmp
        tmp.destroy
        0
      else
        UserLove.create(user_id: user_id, blog_id: blog_id)
        1
      end
    end
  end
end
