# encoding: utf-8
require 'rails_helper'

RSpec.describe "留言页面", type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe "index" do
    describe "有两条留言" do
      before(:each) do
        @message     = FactoryGirl.create(:message)
        @message_2   = FactoryGirl.create(:message_2)
        visit messages_path
      end

      it { should have_selector('p.message_title', text: "吐槽（2）") }
      it { should have_content(@message.content) }
      it { should_not have_content("还没有人留下痕迹，还不快来抢沙发！！！！！！！") }
    end

    describe "没有留言" do
      before(:each) do
        visit messages_path
      end

      it { should have_content("还没有人留下痕迹，还不快来抢沙发！！！！！！！") }
      it { should have_selector("img[src$='/images/shafa.jpg']") }
    end

    describe "登录的账号才能发表留言" do
      before(:each) do
        login user
        visit messages_path
        msg_text_area = find(:css, ".msg_text_area")
        fill_in msg_text_area,   with: "吐槽测试"
      end
      #it "可以发表" do
      #  expect do
      #    click_button("发表")
      #  end.to change(Message, :count)
      #end
    end
  end
end
