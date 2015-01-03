# encoding : utf-8
class Link < ActiveRecord::Base
  attr_accessible :description, :href, :title, :link_category_id
  belongs_to  :link_category
  validates :title,                     presence: true, length: { minimum: 1, maximum: 20 }
  validates :href,                      presence: true
  validates :link_category_id,          presence: true

  def category
    LinkCategory.find(link_category_id).category
  end
end
