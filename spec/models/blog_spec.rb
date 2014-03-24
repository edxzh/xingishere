# encoding : utf-8
require File.dirname(__FILE__) + '/../spec_helper'

describe Blog do
  let(:user) { FactoryGirl.create(:user) }
  let(:blog_category) { FactoryGirl.create(:blog_category) }

  before do
    @blog = FactoryGirl.create(:blog, user_id: user.id, blog_category_id: blog_category.id)
  end

  subject { @blog }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "模型校验" do
    it "缺少user_id" do
      @blog.user_id = nil
      expect(@blog).not_to be_valid
    end

    it "缺少title" do
      @blog.title = " "
      expect(@blog).not_to be_valid
    end

    it "缺少内容" do
      @blog.content = " "
      expect(@blog).not_to be_valid
    end
  end

  describe "class method" do
  end

  describe "instance method" do
    it ".username" do
      expect(@blog.username).to eq user.name
    end

    it ".category_name" do
      expect(@blog.category_name).to eq blog_category.name
    end

    it ".loves_count" do
      user_love = FactoryGirl.create(:user_love, user_id: user.id, blog_id: @blog.id)
      expect(@blog.loves_count).to eq 1
    end
  end
end
