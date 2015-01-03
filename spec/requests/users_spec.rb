# encoding : utf-8
require 'spec_helper'
# require 'factory_girl'
# require 'factories/users.rb'

describe "Users pages" do
  subject { page }
  describe "用户注册页面的内容测试" do
    # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    before { visit register_path }

    it { should have_content('注册') }
    it { should have_title('注册') }

  end
  describe "注册页面创建功能" do
    before { visit register_path }

    describe "无效的数据" do
      before do
        fill_in "user[email]",            with: "test"
        fill_in "user[password]",         with: "a" * 5
      end
      it "无法创建新用户" do
        expect { click_button("submit") }.not_to change(User, :count)
      end
    end
    describe "有效的数据" do
      before do
        fill_in "user[name]",                   with: "sadasdf"
        fill_in "user[password]",               with: "password"
        fill_in "user[password_confirmation]",  with: "password"
        fill_in "user[email]",                  with: "tedsdfst@qq.com"
      end
      it "可以成功创建用户" do
        expect { click_button("submit") }.to change(User, :count)
      end

      describe "用户注册成功" do
        before { click_button("submit") }
        let(:user) { User.find_by_email("test@qq.com") }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: '注册成功') }
      end
    end
  end

  describe "个人主页" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:b1) { FactoryGirl.create(:blog, user_id: user.id) }
    let!(:b2) { FactoryGirl.create(:blog2, user_id: user.id) }

    before(:each) do
      visit user_path(user)
      login user
    end

    it { puts page.html;should have_content(user.name) }
    it { should have_title(user.name) }

    describe "blogs" do
      it { should have_content(b1.content) }
      it { should have_content(b1.content) }
      it { should have_content(user.blogs.count) }
    end
  end

  # 用户编辑页面
  describe "编辑" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do 
      login user
      visit edit_user_path(user)
    end

    describe "页面" do
      it { should have_content("确认") }
      it { should have_title("资料编辑") }
    end
    describe "填写无效数据" do
      before { click_button "保存" }

      it { should have_content('失败') }
    end
    describe "填写有效数据" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "user[name]",                     with: new_name
        fill_in "user[email]",                    with: new_email
        fill_in "user[password]",                 with: user.password
        fill_in "user[password_confirmation]",    with: user.password
      end
      it { should have_title(new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('退出', href: logout_path) }
      specify { expect(user.reload.name).to eq new_name }
      specify { expect(user.reload.email).to eq new_email }
    end
  end

  # 验证
  describe "权限控制：" do
    describe "未登录用户" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the users controller" do
        before { visit edit_user_path(user.id) }

        describe "进入列表页" do
          before { visit users_path }
          it { should have_title("页面找不到了") }
        end
      end

      describe "提交更新用户资料" do
        before { put user_path(user) }
        specify { expect(response).to redirect_to(login_path) }
      end
    end

    describe "没有权限的用户" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@qq.com") }
      before(:each) do
        login user
      end

      describe "进入编辑界面" do
        before { get edit_user_path(wrong_user) }
        specify { expect(response.body).not_to match("资料编辑") }
        specify { expect(response).to redirect_to(root_url) }
      end
      describe "发送更新请求" do
        before { patch user_path(wrong_user) }
        specify { expect(response).to redirect_to(root_url) }
      end
    end

  end

  describe "列表页" do
    before do
      login FactoryGirl.create(:admin)
      FactoryGirl.create(:user, name: "kobe",  email: "kobe@qq.com")
      FactoryGirl.create(:user, name: "james", email: "james@qq.com")
      visit users_path
    end

    it { should have_title("用户列表") }
    it { should have_content("用户列表") }

    describe "pagination" do
      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all) { User.delete_all }
      it { should have_selector('ul.pagination') }
    end

    describe "删除用户链接" do
      it { should have_link('删除') }
      describe "管理员用户登录" do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          login admin
          visit users_path
        end
        it { should have_link('删除') }
        it "可以删除其他用户" do
          expect do
            click_button "删除"
          end.to_change(User, :count).by(-1)
        end
        it { should_not have_link('删除', href: user_path(admin)) }
      end
    end

  end

end
