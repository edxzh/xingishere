# encoding : utf-8
class Link < ActiveRecord::Base
  attr_accessible :category, :description, :href, :title
  validates :title,         presence: true, length: { minimum: 1, maximum: 20 }
  validate  :href,          presence: true
  validate  :category,      presence: true,  default: "其它"
end
