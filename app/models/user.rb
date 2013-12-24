# encoding : utf-8
class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessible :username, :password, :password_confirmation, :name, :sex, :birthday, :status, :height, :position, :address, :relation, :image, :rights, :score, :description, :email
  STATUS    = %w(single married divorce).freeze
  RELATION  = %w(primary junior senior colleage society workmate relative)
  has_many  :user_loves,      dependent:  :destroy
  has_many  :blogs,           dependent:  :destroy
  has_many  :comments,        dependent:  :destroy
  # 加入has_secure_password后不再需要此代码
  # attr_accessor :password,  :password_confirmation

  before_save { self.email = email.downcase }

  # validates :username,    presence: true, uniqueness: true
  # username is quit

  validates :sex,         presence: { message: '请选择性别' }, :if => :profile?

  validates :password,    presence: true, confirmation: true, length: { minimum: 6, maximum: 20 }, unless: :profile?
  validates :name,        presence: true, :if => :profile?
  validates :email,       presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, unless: :profile?
  has_secure_password

  def status_name
    I18n.t("user.status.#{STATUS.at(self.status)}")
  end
  def status_name=(name)
    self.status = STATUS.index(name)
  end

  def relation_name
    I18n.t("user.relation.#{RELATION.at(self.status)}")
  end
  def relation_name=(name)
    self.relation = RELATION.index(name)
  end

  def profile?
    self[:sex]
  end

  def advanced?
    self[:address]
  end
  private

end
