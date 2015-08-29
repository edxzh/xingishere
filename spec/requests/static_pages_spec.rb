# encoding : utf-8
require 'rails_helper'

describe "测试访问一些静态页面" do

  subject { page }

  describe "GET /static_pages" do

    describe "测试 xingge 页面" do
      before(:each) do
        visit xingge_path
      end

      it { should have_title("关于博主") }
      # it { should have_selector("link[href$='/onepage/onepage-scroll.css']") }
      # it { should have_selector("script[src$='/onepage/onepage-scroll.js']") }
      # TODO 测试页面中的 css 和 js
    end

    describe "resume 页面" do
      before(:each) do
        visit resume_path
      end

      it { should have_title("个人简历") }
      it { should have_content("个人简历") }
      it { should have_content("周星") }
    end

    describe "测试 about 页面" do
      before(:each) do
        visit about_path
      end

      it { should have_content("where better happens") }
    end

    describe "测试404界面的标题和内容" do
      before(:each) do
        visit '/sfwefwef'
      end

      it { should have_title("页面找不到了") }
    end

    describe "测试500页面" do
      before(:each) do
        visit '/500.html'
      end
      it { should have_title("发生了一些错误。。。") }
      it { should have_content("万恶滴程序猿造成了一些错误。。。") }
      it { should have_link("返回首页", href: root_path) }
      it { should have_link("查看博客", href: blogs_path) }
    end

    describe "测试422页面" do
      before(:each) do
        visit '/422.html'
      end

      it { should have_title("不应该的错误") }
      it { should have_content("这是一个 422 错误，您不应该看到它") }
    end
  end
end
