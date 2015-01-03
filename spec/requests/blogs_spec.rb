# encoding: utf-8
require 'spec_helper'

describe "blog page" do
  describe "index" do
    before(:each) do
      @blog               = FactoryGirl.create(:blog)
      @unpublished_blog   = FactoryGirl.create(:unpublished_blog)
      @blog2              = FactoryGirl.create(:blog2)
      @blog3              = FactoryGirl.create(:blog3)
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

    it {puts page.html; should have_content @blog.title }
    it { should have_content @blog.content }
  end

end
