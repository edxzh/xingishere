class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :category
  belongs_to  :user
  has_many    :tags
  has_many    :user_loves
  validates :user_id,           presence: true
  validates :title,             presence: true

  default_scope -> { order('created_at DESC') }
  scope :category, ->(category) { where("category = ?", category) if category.present? }
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

end
