#encoding: utf-8
class BlogCategory < ActiveRecord::Base
  has_many  :blogs

  validates :name,      presence: { message: '必须存在类别名' }, uniqueness: { message: '类别名已存在' }
end
