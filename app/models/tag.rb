# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  blog_id    :integer          not null
#  name       :string(20)       not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ActiveRecord::Base
  belongs_to :blog
end
