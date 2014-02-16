class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :blog_category_id, :view_total
  belongs_to  :user
  belongs_to  :blog_category
  has_many    :tags
  has_many    :user_loves
  validates :user_id,           presence: true
  validates :title,             presence: true

  validates :user,              presence: true

  default_scope -> { order('created_at DESC') }
  scope :keyword,  ->(keyword) { where("title like ? or content like ?", "%#{keyword}%", "%#{keyword}%") if keyword.present? }

  # 暂时不用这个功能
  # scope :current_user_blog, ->() { where("user_id = ?", current_user.id }
  # scope :tag,      ->(tag) do
  #   tags.where("name = ?", tag)
  # end

  # 日志作者的名字
  def username
    User.where("id = ?", user_id).first.name
  end
  def loves_count
    UserLove.where("blog_id = ?", id).count
  end
  def category
    BlogCategory.find(blog_category_id).name
  end
  def self.category_find(category_id)
    BlogCategory.find(category_id).blogs if category_id.present?
  end

end
