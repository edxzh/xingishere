# == Schema Information
#
# Table name: tips
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tip < ActiveRecord::Base
  validates :content, presence: true
end
