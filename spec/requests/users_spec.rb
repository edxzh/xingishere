require 'rails_helper'

RSpec.describe 'Users pages', type: :feature do
  subject { page }

  describe '用户注册页面的内容测试' do
    before { visit register_path }

    it { should have_content('注册') }
    it { should have_title('注册') }
  end

  describe '注册页面创建功能' do
    before { visit register_path }

    describe '无效的数据' do
      before do
        fill_in 'user[email]',            with: 'test'
        fill_in 'user[password]',         with: 'a' * 5
      end

      it '无法创建新用户' do
        expect { click_button('submit') }.not_to change(User, :count)
      end
    end

    describe '有效的数据' do
      before do
        fill_in 'user[name]',                   with: 'sadasdf'
        fill_in 'user[password]',               with: 'password'
        fill_in 'user[password_confirmation]',  with: 'password'
        fill_in 'user[email]',                  with: 'tedsdfst@qq.com'
      end

      it '可以成功创建用户' do
        expect { click_button('submit') }.to change(User, :count)
      end

      describe '用户注册成功' do
        before { click_button('submit') }
        let(:user) { User.find_by_email('tedsdfst@qq.com') }

        it { should have_content(user.email) }
        it { should have_selector('div.alert.alert-success', text: '注册成功') }
      end
    end
  end

  describe '个人主页' do
    let(:user) { FactoryGirl.create(:user) }
    let!(:b1) { FactoryGirl.create(:blog, user_id: user.id) }
    let!(:b2) { FactoryGirl.create(:blog2, user_id: user.id) }

    before(:each) do
      login user
      visit user_path(user)
    end

    it { should have_content(user.name) }
    it { should have_title(user.name) }

    describe 'blogs' do
      it { should have_content(b1.title) }
      it { should have_content(b2.title) }
      it { should have_content(user.blogs.count) }
    end

    describe 'profile 页面' do
      let(:user) { FactoryGirl.create(:user) }
      before(:each) do
        login user
        visit account_profile_path
      end
      it { should have_title('资料编辑') }
      it { should have_button('确认') }
    end
  end

  describe '权限控制：' do
    describe '未登录用户' do
      let(:user) { FactoryGirl.create(:user) }

      describe '进入个人信息页面' do
        before { visit account_profile_path }
        it { should have_button('登录') }
      end
    end
  end
end
