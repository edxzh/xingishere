# encoding : utf-8
class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation, :name, :sex, :birthday, :status, :height, :position, :address, :relation, :image, :rights, :score, :description
  attr_accessor :password,  :password_confirmation

  validates :username,    presence: true, uniqueness: true

  validates :sex, presence: { message: '请选择性别' }, :if => :profile?

  validates :password,    confirmation: true
  validate  :passowrd_must_be_present

  def User.authenticate(name, password)
    if user = find_by_username(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def profile?
    self[:username]
  end
  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "wibble" + salt)
  end

  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  def profile?
    self[:sex]
  end

  def advanced?
    self[:address]
  end
  private

    def passowrd_must_be_present
      errors.add(:password, "请输入密码") if hashed_password.blank?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
