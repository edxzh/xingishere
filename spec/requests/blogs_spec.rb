require 'rails_helper'

RSpec.describe 'blog page', type: :feature do
  describe 'index' do
    subject { page }

    before(:each) do
      @blog               = FactoryGirl.create(:blog)
      @unpublished_blog   = FactoryGirl.create(:unpublished_blog)
      @blog2              = FactoryGirl.create(:blog2)
      @blog3              = FactoryGirl.create(:blog3)
      visit blogs_path
    end

    it { should have_title '博客列表' }
    it { should have_content @blog.title }
    it { should have_content @blog2.view_total }
    it { should have_content @blog3.comments.count }
    it { should_not have_content @unpublished_blog.title }
  end

  describe 'show' do
    subject { page }

    before(:each) do
      @blog = FactoryGirl.create(:blog)
      visit blog_path(@blog)
    end

    it { should have_title @blog.title }
    it { should have_content @blog.content }

    describe '用户未登录' do
      it { should have_selector("input[id='cmt_user_name']") }
      it { should have_selector("input[id='cmt_user_email']") }

      it '未登录用户未填写昵称无法评论成功' do
        fill_in 'cmt_user_email',   with: '111111@qq.com'
        fill_in 'cmt_text_area',    with: 'comment content'
        expect { click_button '发表' }.not_to change(Comment, :count)
      end

      it '未登录用户未填写邮箱无法评论成功' do
        fill_in 'cmt_user_name',    with: 'name'
        fill_in 'cmt_text_area',    with: 'comment content'
        expect { click_button '发表' }.not_to change(Comment, :count)
      end
    end

    describe '用户登录了' do
      before(:each) do
        @user = FactoryGirl.create(:user)
        login @user
      end

      it { should_not have_selector("input[id='cmt_user_name']") }
      it { should_not have_selector("input[id='cmt_user_email']") }
    end
  end
end
