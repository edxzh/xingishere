#encoding: utf-8
# == Schema Information
#
# Table name: blog_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  blog_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BlogCategory < ActiveRecord::Base
  has_many  :blogs

  validates :name,      presence: { message: '必须存在类别名' }, uniqueness: { message: '类别名已存在' }
end
