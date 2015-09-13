# encoding: utf-8
class Blog < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :blog_category
  has_many    :tags
  has_many    :user_loves,        dependent:  :destroy, inverse_of: :blog,  class_name: UserLove
  has_many    :comments
  has_many    :loved_users,       through:  :user_loves, source: :user

  validates   :user_id,           presence: true
  validates   :title,             presence: true, uniqueness: true
  validates   :content,           presence: true
  validates   :url_name,          presence: true, uniqueness: true
  validates   :seo_keyword,       presence: true
  validates   :blog_category_id,  presence: true

  scope :weight_order, -> { order('weight DESC, created_at DESC') }
  scope :published, -> { where("publish_status = ?", Settings.publish_status.published) }
  scope :keyword,  ->(keyword) do
    where("title like ? or content like ?", "%#{keyword}%", "%#{keyword}%") if keyword.present?
  end
  scope :category, ->(category_id) { where("blog_category_id = ?", category_id) }

  delegate :name,   to: :blog_category,   prefix: true
  delegate :name,   to: :user,            prefix: true

  def to_param
    url_name
  end

  class << self
    def like_by_user?(user_id, blog_id)
      if UserLove.where("user_id = ? AND blog_id = ?", user_id, blog_id).first
        true
      else
        false
      end
    end
  end

  # 通过类别找一批blog
  def self.category_find(category_id)
    BlogCategory.find(category_id).blogs if category_id.present?
  end

  def published?
    publish_status?
  end
end
