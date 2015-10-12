# encoding: utf-8
require 'rails_helper'

RSpec.describe '留言页面', type: :feature do
  let(:user) { FactoryGirl.create(:user) }
  subject { page }

  describe 'index' do
    describe '有两条留言' do
      before(:each) do
        @message     = FactoryGirl.create(:message)
        @message_2   = FactoryGirl.create(:message_2)
        visit messages_path
      end

      it { should have_selector('p.message_title', text: '吐槽（2）') }
      it { should have_content(@message.content) }
      it { should_not have_content('还没有人留下痕迹，还不快来抢沙发！！！！！！！') }
    end

    describe "没有留言" do
      before(:each) do
        visit messages_path
      end

      it { should have_content('还没有人留下痕迹，还不快来抢沙发！！！！！！！') }
      it { should have_selector("img[src$='/images/shafa.jpg']") }
    end
  end
end
