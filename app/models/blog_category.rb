#encoding: utf-8
class BlogCategory < ActiveRecord::Base
  attr_accessible :blog_id, :name
  has_many  :blogs

  validates :name,      presence: { message: '必须存在类别名' }, uniqueness: { message: '类别名已存在' }
  delegate  :name,  to: blog, prefix: true
end
