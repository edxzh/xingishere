# encoding : utf-8
require File.dirname(__FILE__) + '/../spec_helper'

describe Blog do
  let(:user) { FactoryGirl.create(:user) }
  let(:blog_category) { FactoryGirl.create(:blog_category) }
  let(:blog_category2) { FactoryGirl.create(:blog_category2) }

  before :each do
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

  describe "测试scope" do
    it "scope published" do
      @blog = FactoryGirl.create(:unpublished_blog, user_id: user.id)
      expect(Blog.published.to_a).not_to include @blog
    end

    it "scope keyword" do
      %w(rails文章1, ruby文章2, swift文章3).each do |s|
        FactoryGirl.create(:blog2, { user_id: user.id, title: s, url_name: s } )
      end

      expect(Blog.published.keyword("文章").count).to eq 3
      expect(Blog.published.keyword("3").count).to eq 1
    end

    it "scope category" do
      %w(rails文章1, ruby文章2, swift文章3).each do |s|
        FactoryGirl.create(:blog2, { user_id: user.id, title: s, url_name: s, blog_category_id: blog_category2.id })
      end

      expect(Blog.published.category(blog_category2.id).count).to eq 3
      expect(Blog.published.category(blog_category.id).count).to eq 1
    end
  end

  describe "类方法 class method" do
    it "#category_find" do
      %w(rails文章1, ruby文章2, swift文章3).each do |s|
        FactoryGirl.create(:blog2, { user_id: user.id, title: s, url_name: s, blog_category_id: blog_category2.id })
      end
      expect(Blog.published.category_find(blog_category2.id).count).to eq 3
    end
  end

  describe "实例方法 instance method" do
    # it ".username" do
    #   expect(@blog.username).to eq user.name
    # end
    #
    # it ".loves_count" do
    #   user_love = FactoryGirl.create(:user_love, user_id: user.id, blog_id: @blog.id)
    #   expect(@blog.loves_count).to eq 1
    # end
  end
end
