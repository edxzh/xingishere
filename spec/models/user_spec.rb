# encoding : utf-8
require 'spec_helper'

describe User do
  before {
    @user = FactoryGirl.create(:user)
    @profile_user = FactoryGirl.create(:profile_user)
  }

  subject { @user }

  it { should respond_to(:username, :password, :password_confirmation, :name, :sex, :birthday, :status, :email, :height, :position, :address, :relation, :image, :rights, :score, :description) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }
  it { should respond_to(:blogs) }

  it { should be_valid }

  describe "常量" do
    it "STATUS应该是个指定的数组" do
      expect(User::STATUS).to eq %w(single married divorce)
    end

    it "RELATION应该是个指定的数组" do
      expect(User::RELATION).to eq %w(primary junior senior colleage society workmate relative)
    end
  end

  describe "模型校验" do
    before {
      @user = FactoryGirl.create(:user)
    }
    it "用户姓名不存在时" do
      @user.name = " "
      expect(@user).not_to be_valid
    end

    it "密码不存在时" do
      @user.password = " "
      expect(@user).not_to be_valid
    end

    it "两次输入密码不匹配时" do
      @user.password_confirmation = "password1"
      expect(@user).not_to be_valid
    end

    it "密码太长时" do
      @user.password = "x" * 21
      expect(@user).not_to be_valid
    end

    it "密码太短时" do
      @user.password = "x" * 5
      expect(@user).not_to be_valid
    end

    it "email格式无效时" do
      email = %w( user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com )
      email.each do |invalid_email|
        @user.email =  invalid_email
        expect(@user).not_to be_valid
      end
    end

    it "有效的email格式" do
      email = %w( user@foo.com A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn )
      email.each do |valid_email|
        @user.email = valid_email
        expect(@user).to be_valid
      end
    end

    it "Email的大小写敏感" do
      @user_with_same_email = @user.dup
      @user_with_same_email.email = @user.email.upcase
      expect(@user_with_same_email).not_to be_valid
    end

    it "设置管理员权限" do
      @user.toggle!(:admin)
      expect(@user.admin).to eq true
    end

    it "普通用户和高级用户的信息" do
      expect(@user.status_name).to eq "单身"
      expect(@user.relation_name).to eq "小学同学"

      expect(@profile_user.status_name).to eq "已婚"
      expect(@profile_user.relation_name).to eq "中学同学"

    end

  end

  describe "与blog关联" do
    let!(:older_blog) { FactoryGirl.create(:blog, user_id: @user.id, created_at: 1.day.ago) }
    let!(:newer_blog) { FactoryGirl.create(:blog, user_id: @user.id, created_at: 1.hour.ago) }

    it "测试blog的默认排序" do
      expect(@user.blogs.to_a).to eq [newer_blog, older_blog]
    end
  end

  describe "测试登录的authenticate方法" do
    let(:found_user) { User.where("email = ?", @user.email).first }

    it "登录验证成功" do
      user = found_user.authenticate(@user.password)
      expect(user).to eq @user
    end

    it "验证失败" do
      user = found_user.authenticate("invalid_password")
      expect(user).no_to eq @user
    end
  end

end
