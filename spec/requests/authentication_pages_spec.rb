# encoding : utf-8
require 'spec_helper'

describe "登录验证Authentication" do
  subject { page }
  describe "登录界面" do
    before { visit login_path }

    it { should have_content("登录") }
    it { should have_title("登录") }

    describe "表单为空时点击登录" do
      before { click_button "登录" }

      it { should have_title "登录" }
      it { should have_content "帐号/密码不能为空" }

      describe "跳转到主页" do
        before { click_link "主页" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "输入正确时点击登录" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "username",        with: user.email.downcase
        fill_in "password",        with: user.password
        click_button "登录"
      end

      # before { login user }

      it { should have_title(full_title(user.name)) }
      it { should have_link("个人主页", href: user_path(user)) }
      it { should have_link("个人资料设置", href: edit_user_path(user)) }
      it { should have_link("退出", href: login_path) }
      it { should_not have_link("登录", href: login_path) }
    end
  end

  describe "authentication" do
    let(:user) { FactoryGirl.create(:user) }
    let(:no_admin) { FactoryGirl.create(:user) }

    before { login no_admin, no_capybara: true }

    describe "submitting a DELETE request to User destroy action" do
      before { delete user_path(user) }
      specify { expect(response).to redirect_to(root_path) }
    end

  end
end
