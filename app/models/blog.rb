class Blog < ActiveRecord::Base
  attr_accessible :title, :content, :user_id, :blog_category_id, :view_total, :weight, :publish_status, :url_name, :seo_keyword
  belongs_to  :user
  belongs_to  :blog_category
  has_many    :tags
  has_many    :user_loves
  has_many    :comments
  validates :user_id,           presence: true
  validates :title,             presence: true
  validates :content,           presence: true
  validates :url_name,          presence: true, uniqueness: true
  validates :seo_keyword,       presence: true

  # validates :user,              presence: true

  default_scope -> { order('weight DESC, created_at DESC') }
  scope :published, -> { where("publish_status = ?", Settings.publish_status.published) }
  scope :keyword,  ->(keyword) { where("title like ? or content like ?", "%#{keyword}%", "%#{keyword}%") if keyword.present? }
  scope :category, ->(category_id) { where("blog_category_id = ?", category_id) }

    class << self
    # TODO 此方法需重构
    def like_by_user?(user_id, blog_id)
      if UserLove.where("user_id = ? AND blog_id = ?", user_id, blog_id).first
        true
      else
        false
      end
    end

    def loved_by_user(user_id)
      blog_ids = UserLove.where(user_id: user_id).pluck("blog_id")
      where(id: blog_ids)
    end

    # def category
    #   BlogCategory.find(blog_category_id).name
    # end
  end

  # 日志作者的名字
  def username
    User.find(user_id).name
  end

  # 共有多少人喜欢
  def loves_count
    UserLove.where("blog_id = ?", id).count
  end

  # 类别名
  def category_name
    BlogCategory.find(blog_category_id).name
  end

  # 通过类别找一批blog
  def self.category_find(category_id)
    BlogCategory.find(category_id).blogs if category_id.present?
  end

end
