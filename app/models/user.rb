# encoding : utf-8
class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessible :username, :password, :password_confirmation, :name, :sex, :birthday, :status, :height, :position, :address, :relation, :image, :rights, :score, :description, :email
  STATUS    = %w(single married divorce).freeze
  RELATION  = %w(primary junior senior colleage society workmate relative)
  has_many  :user_loves,      dependent:  :destroy, inverse_of: :user,  class_name: UserLove
  has_many  :blogs,           dependent:  :destroy, inverse_of: :user
  has_many  :comments,        dependent:  :destroy, inverse_of: :user
  has_many  :link_categories, dependent:  :destroy, inverse_of: :user
  has_many  :messages

  # 加入has_secure_password后不再需要此代码
  # attr_accessor :password,  :password_confirmation

  before_save { self.email = email.downcase }

  # validates :username,    presence: true, uniqueness: true
  # username is quit

  validates :sex,         presence: { message: '请选择性别' }, :if => :profile?

  validates :password,    presence: { message: '请输入密码' }, confirmation: { message: '两次输入的密码不一致' }, length: { minimum: 6, maximum: 20, message: '密码长度应大于6个字符，小于20个字符' }, on: :create
  validates :name,        presence: { message: '请输入名字' }, uniqueness: { case_sensitive: false, message: '名字已存在，请重新填写' }
  validates :email,       presence: { message: '请输入email' }, format: { with: VALID_EMAIL_REGEX, message: 'email格式不正确' }, uniqueness: { case_sensitive: false, message: '重复的email，请重新填写' }#, unless: :profile?
  validates :height,      numericality: { only_integer: true }, :if => :profile?
  has_secure_password

  def status_name
    I18n.t("user.status.#{STATUS.at(status)}")
  end
  def status_name=(name)
    self.status = STATUS.index(name)
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

end
