# encoding: utf-8
class Subscribe < ActiveRecord::Base
  attr_accessible :email
  validates :email, presence: { message: "please input email" }, uniqueness: { message: "you have subscribed" }, format: { with: Regexp.new(Settings.regexp.email), message:'email format incorrect' }
end
