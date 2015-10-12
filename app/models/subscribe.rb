# encoding: utf-8
# == Schema Information
#
# Table name: subscribes
#
#  id         :integer          not null, primary key
#  email      :string(40)       default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscribe < ActiveRecord::Base
  validates :email, presence: { message: 'please input email' },
    uniqueness: { message: 'you have subscribed' },
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'email format incorrect' }
end
