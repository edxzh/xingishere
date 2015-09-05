# encoding : utf-8
class Comment < ActiveRecord::Base
  attr_accessible :content, :blog_id, :user_id, :pid, :publish_status, :nickname, :email, :remote_ip
  belongs_to  :user
  belongs_to  :blog

  validates :user_id, :blog_id, :nickname, :email, :content,      presence: true
  validates :nickname, length: { minimum: 1, maximum: 8 }
  validates :content,  length: { minimum: 1, maximum: 160 }
  validate_harmonious_of :nickname, message: '昵称里也敢放敏感词...想喝茶了吗'
  validate_harmonious_of :content,  message: '内容里不要放敏感词嘛...要喝茶的哦'

  scope :published, -> { where("publish_status = ?", Settings.publish_status.published) }
end
