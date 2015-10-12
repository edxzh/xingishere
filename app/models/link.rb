# == Schema Information
#
# Table name: links
#
#  id               :integer          not null, primary key
#  title            :string(20)       not null
#  href             :string(255)      not null
#  description      :text(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  link_category_id :integer
#

# encoding : utf-8
class Link < ActiveRecord::Base
  belongs_to  :link_category
  validates :title,                     presence: true, length: { minimum: 1, maximum: 20 }
  validates :href,                      presence: true
  validates :link_category_id,          presence: true

  def category
    LinkCategory.find(link_category_id).category
  end
end
