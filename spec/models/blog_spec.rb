# encoding : utf-8
require File.dirname(__FILE__) + '/../spec_helper'

describe Blog do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @blog = user.blogs.create(title: "日记1", content: "我开始写日记啦啦啦", category_name: "日记")
  end
  subject { @blog }
  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "without user_id" do
    before { @blog.user_id = nil }
    it { should_not be_valid }
  end

  describe "#username" do
    # @blog.save
    # @blog.username.should eq user.name
  end
end
