# encoding : utf-8
require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before { @user = User.new(username: "example user", password: "abc123", password_confirmation: "abc123", name: "Example User", sex: "male", email: "xxx@xx.com") }

  subject { @user }

  it { should respond_to(:username, :password, :password_confirmation, :name, :sex, :birthday, :status, :email, :height, :position, :address, :relation, :image, :rights, :score, :description) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "用户名不存在时" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  describe "密码不存在时" do
    before { @user.password = " " }
    it { should_not be_valid }
  end
  describe "两次输入密码是否匹配" do
    before { @user.password_confirmation = "abce" }
    it { should_not be_valid }
  end

  # 验证长度
  describe "密码不能过长或者过短" do
    before do
      @user.password = "xx" 
      @user.password = "x" * 60
    end
    it { should_not be_valid }
  end

  # 验证格式
  describe "无效的email格式" do
    it "should be valid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                             foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email =  invalid_address
        expect(@user).not_to be_valid
      end
    end
  end
  describe "有效的email格式" do
    it "should not be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  describe "UserName和Email不能重复" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end
end
