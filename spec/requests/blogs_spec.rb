# encoding: utf-8
require 'spec_helper'

describe "blog page" do
  describe "index" do
    before(:each) do
      @blog_category      = FactoryGirl.create(:blog_category)
      @blog               = FactoryGirl.create(:blog, blog_category_id: @blog_category.id)
      @unpublished_blog   = FactoryGirl.create(:unpublished_blog, blog_category_id: @blog_category.id)
      @blog2              = FactoryGirl.create(:blog2, blog_category_id: @blog_category.id)
      @blog3              = FactoryGirl.create(:blog3, blog_category_id: @blog_category.id)
      visit blogs_path
    end
    subject { page }

    it { should have_title "博客列表" }
    it { should have_content @blog.title }
    it { should have_content @blog2.view_total }
    it { should have_content @blog3.comments.count }
    it { should_not have_content @unpublished_blog.title }
  end

  describe "show" do
    before(:each) do
      @blog               = FactoryGirl.create(:blog)
      visit blog_path(@blog)
    end

    subject { page }

    it { should have_content @blog.title }
    it { should have_content @blog.content }
  end

end
