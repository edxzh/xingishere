# encoding : utf-8
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should respond_to(:password, :password_confirmation) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should have_many(:user_loves).dependent(:destroy).inverse_of(:user).class_name('UserLove') }
  it { should have_many(:blogs).dependent(:destroy).inverse_of(:user) }
  it { should have_many(:comments).dependent(:destroy).inverse_of(:user) }
  it { should have_many(:link_categories).dependent(:destroy).inverse_of(:user) }
  it { should have_many(:messages) }
  it { should have_many(:love_blogs).through(:user_loves).source(:blog) }

  it { should validate_presence_of(:password).with_message('请输入密码') }
  it { should validate_confirmation_of(:password).with_message('两次输入的密码不一致') }
  it { should validate_length_of(:password).is_at_most(20).is_at_lease(6).with_message('请输入名字').on(:create) }
  it { should validate_presence_of(:name).with_message('请输入名字') }
  it { should validate_uniqueness_of(:name).with_message('名字已存在，请重新填写').case_insensitive }
  it { should validate_presence_of(:email).with_message('请输入email') }
  it { should validate_uniqueness_of(:email).with_message('重复的email，请重新填写').case_insensitive }

  it { should be_valid }

  describe '常量' do
    it 'STATUS应该是个指定的数组' do
      expect(User::STATUS).to eq %w(single married divorce)
    end

    it 'RELATION应该是个指定的数组' do
      expect(User::RELATION).to eq %w(primary junior senior colleage society workmate relative)
    end
  end

  describe '与blog关联' do
    before do
      @elder_blog = FactoryGirl.create(:blog, user_id: @user.id, created_at: 1.day.ago)
      @newer_blog = FactoryGirl.create(:blog2, user_id: @user.id, created_at: 1.hour.ago)
    end

    it '测试blog的默认排序' do
      expect(@user.blogs.to_a).to eq [@elder_blog, @newer_blog]
    end
  end

  describe '测试登录的authenticate方法' do
    let(:found_user) { User.where("email = ?", @user.email).first }

    it '登录验证成功' do
      user = found_user.authenticate(@user.password)
      expect(user).to eq @user
    end

    it '验证失败' do
      user = found_user.authenticate("invalid_password")
      expect(user).not_to eq @user
    end
  end
end
