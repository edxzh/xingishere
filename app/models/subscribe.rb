# encoding: utf-8
class Subscribe < ActiveRecord::Base
  attr_accessible :email
  validates :email, presence: { message: "请输入email" }, uniqueness: { message: "您已经订阅" }, format: { with: Regexp.new(Settings.regexp.email), message:'邮件格式不正确' }
end
