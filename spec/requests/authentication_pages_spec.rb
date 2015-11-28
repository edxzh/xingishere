require 'rails_helper'

RSpec.describe '登录验证Authentication' do
  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe '登录界面' do
    before { visit login_path }

    it { should have_content('登录') }
    it { should have_title('登录') }

    describe '输入正确时点击登录' do
      before do
        fill_in 'email',            with: user.email
        fill_in 'password',         with: user.password
        click_button '登录'
      end

      it { should have_link('更多信息', href: xingge_path) }
      it { should have_link('关于本站', href: about_path) }
    end

    describe '输入错误时点击登录' do
      before do
        fill_in 'email',      with: user.email.downcase
        fill_in 'password',   with: 'invalid_password'
        click_button '登录'
      end

      it { should have_title('登录') }
    end
  end
end
