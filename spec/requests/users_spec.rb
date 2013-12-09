# encoding : utf-8
require 'spec_helper'
require 'factory_girl'
require 'factories/users.rb'
# require File.dirname(__FILE__) + '/../spec_helper'

describe "Users pages" do
  subject { page }
  describe "用户注册页面的内容测试" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    before { visit register_users_path }

    it { should have_content('注册') }
    it { should have_title(full_title('注册')) }

  end
  describe "注册页面创建功能" do
    before { visit register_users_path }
    let(:submit) { "提交" }

    describe "无效的数据" do
      before do
        fill_in "user[username]",         with: "test"
        fill_in "user[password]",         with: "a" * 5
      end
      it "无法创建新用户" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    describe "有效的数据" do
      before do
        fill_in "user[username]",               with: "test"
        fill_in "user[password]",               with: "password"
        fill_in "user[password_confirmation]",  with: "password"
        fill_in "user[email]",                  with: "test@qq.com"
      end
      it "可以成功创建用户" do
        expect { click_button submit }.to change(User, :count)
      end

      describe "用户注册成功" do
        before { click_button submit }
        let(:user) { User.find_by_email("test@qq.com") }

        it { should have_title(user.name) }
        it {should have_selector('div.alert.alert-success', text: '注册成功') }
      end
    end
  end

  describe "个人主页" do
    before { visit user_path(user)}
    let(:user) { FactoryGirl.create(:user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

end
