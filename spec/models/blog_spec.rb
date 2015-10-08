# encoding : utf-8
require 'rails_helper'

describe Blog do
  let(:user) { FactoryGirl.create(:user) }
  let(:blog_category) { FactoryGirl.create(:blog_category3) }

  before :each do
    @blog = FactoryGirl.create(:blog)
  end

  subject { @blog }

  it { should respond_to(:content) }
  it { should respond_to(:user_name) }
  it { should respond_to(:blog_category_name) }

  it { should validate_presence_of(:user_id, :title, :content, :seo_keyword, :blog_category_id) }
  it { should validate_uniqueness_of(:title, :url_name) }

  describe '测试scope' do
    it 'scope published' do
      @blog = FactoryGirl.create(:unpublished_blog, user_id: user.id)
      expect(Blog.published.to_a).not_to include @blog
    end

    it 'scope keyword' do
      %w(rails文章1, ruby文章2, swift文章3).each_with_index do |s, index|
        FactoryGirl.create(:blog2, title: s, url_name: s, blog_category_id: index)
      end

      expect(Blog.published.keyword('文章').count).to eq 3
    end

    it 'scope category' do
      %w(rails文章1, ruby文章2, swift文章3).each do |s|
        FactoryGirl.create(:blog2, title: s, url_name: s, blog_category_id: blog_category.id)
      end

      expect(Blog.published.category(blog_category.id).count).to eq 3
    end
  end

  describe '类方法 class method' do
    it '#category_find' do
      %w(rails文章1, ruby文章2, swift文章3).each do |s|
        FactoryGirl.create(:blog2, title: s, url_name: s, blog_category_id: blog_category.id)
      end

      expect(Blog.published.category_find(blog_category.id).count).to eq 3
    end
  end
end
