# encoding: utf-8
class Subscribe < ActiveRecord::Base
  validates :email, presence: { message: 'please input email' },
    uniqueness: { message: 'you have subscribed' },
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'email format incorrect' }
end
