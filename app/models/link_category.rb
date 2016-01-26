# == Schema Information
#
# Table name: link_categories
#
#  id         :integer          not null, primary key
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class LinkCategory < ActiveRecord::Base
  has_many :links
  belongs_to :user
end
