# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(20)
#  name            :string(20)       default("星哥粉丝"), not null
#  password_digest :string(255)
#  sex             :string(255)
#  birthday        :date             default(Thu, 01 Jan 1970), not null
#  status          :integer          default(0), not null
#  height          :integer
#  position        :string(255)
#  address         :string(255)
#  relation        :integer          default(0), not null
#  image           :string(255)
#  rights          :integer          default(2), not null
#  score           :integer          default(0), not null
#  description     :text(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string(255)
#  admin           :boolean          default(FALSE)
#  activate_code   :string(255)
#  activate_status :boolean          default(FALSE), not null
#  remember_token  :string(255)      not null                            # cookie记忆权标
#

# encoding : utf-8
class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  STATUS    = %w(single married divorce).freeze
  RELATION  = %w(primary junior senior colleage society workmate relative)
  has_many  :user_loves,      dependent:  :destroy, inverse_of: :user,  class_name: UserLove
  has_many  :blogs,           dependent:  :destroy, inverse_of: :user
  has_many  :comments,        dependent:  :destroy, inverse_of: :user
  has_many  :link_categories, dependent:  :destroy, inverse_of: :user
  has_many  :messages
  has_many  :love_blogs,      through:  :user_loves, source: :blog

  before_save { self.email = email.downcase }
  after_destroy :change_messages_publish_status

  validates :password,    presence: { message: '请输入密码' },
    confirmation: { message: '两次输入的密码不一致' },
    length: { minimum: 6, maximum: 20, message: '密码长度应大于6个字符，小于20个字符' }, on: :create
  validates :name,        presence: { message: '请输入名字' }, uniqueness: { case_sensitive: false, message: '名字已存在，请重新填写' }
  validates :email,       presence: { message: '请输入email' },
    format: { with: VALID_EMAIL_REGEX, message: 'email格式不正确' },
    uniqueness: { case_sensitive: false, message: '重复的email，请重新填写' }

  validates :height,      numericality: { only_integer: true }, if: :profile?
  validates :sex,         presence: { message: '请选择性别' },  if: :profile?

  has_secure_password

  scope :activated, -> { where("activate_status = ?", true) }

  def status_name
    I18n.t("user.status.#{STATUS.at(status)}")
  end

  def status_name=(name)
    status = STATUS.index(name)
  end

  def status_EN
    STATUS.at(status)
  end

  def relation_name
    I18n.t("user.relation.#{RELATION.at(relation)}")
  end

  def relation_name=(name)
    self.relation = RELATION.index(name)
  end

  def relation_EN
    RELATION.at(relation)
  end

  def profile?
    self[:sex]
  end

  def advanced?
    self[:address]
  end

private

  def change_messages_publish_status
    self.messages.update_all(publish_status: Settings.publish_status.deleted)
  end
end
