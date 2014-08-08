# encoding: utf-8
class Subscribe < ActiveRecord::Base
  attr_accessible :email
  validates :email,     presence: { message: "email不能为空" }, uniqueness: { message: "您已经订阅" }
end
