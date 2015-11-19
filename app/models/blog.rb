# == Schema Information
#
# Table name: blogs
#
#  id               :integer          not null, primary key
#  title            :string(30)       default("我的日志"), not null
#  content          :text(65535)      not null
#  user_id          :integer          not null
#  tag              :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  blog_category_id :integer
#  view_total       :integer          default(0), not null
#  weight           :integer          default(0), not null
#  publish_status   :boolean          default(TRUE), not null
#  seo_keyword      :string(100)      default(""), not null
#  url_name         :string(50)       default(""), not null
#

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
  scope :keyword,  ->(keyword) do
    where("title like ? or content like ?", "%#{keyword}%", "%#{keyword}%") if keyword.present?
  end
  scope :published, -> { where("publish_status = ?", Settings.publish_status.published) }
  scope :category, ->(category_id) { where("blog_category_id = ?", category_id) }

  delegate :name,   to: :blog_category,   prefix: true
  delegate :name,   to: :user,            prefix: true

  def to_param
    url_name
  end

  def published?
    publish_status?
  end

  class << self
    def like_by_user?(user_id, blog_id)
      if UserLove.where("user_id = ? AND blog_id = ?", user_id, blog_id).first
        true
      else
        false
      end
    end

    # 通过类别找一批blog
    def category_find(category_id)
      BlogCategory.find(category_id).blogs if category_id.present?
    end
  end
end
