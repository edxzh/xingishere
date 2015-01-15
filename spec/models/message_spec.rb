# encoding: utf-8
require 'spec_helper'

describe Message do
  before(:each) do
    @user     = FactoryGirl.create(:user)
    @message  = FactoryGirl.create(:message, user: @user)
    @message2 = FactoryGirl.create(:message_2, user: @user)
  end
  subject { @message }

  it { should validate_presence_of(:content) }
  it { should respond_to(:user) }
  its(:user) { should == @user }

  it "删除用户时应该改变用户评论的发布状态" do
    messages = @user.messages.dup
    @user.destroy
    messages.each do |message|
      expect(Message.find_by_id(message.id).publish_status).to eq !0
    end
  end

end
