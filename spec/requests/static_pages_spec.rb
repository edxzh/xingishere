# encoding : utf-8
require 'spec_helper'

describe "测试访问一些静态页面" do
  describe "GET /static_pages" do
    it "测试访问主页，标题和内容" do
      visit '/'
      expect(page).to have_content("主页")
      expect(page).to have_title("主页")
    end
    it "测试404界面的标题和内容" do
      visit '/404.html'
      expect(page).to have_title("页面找不到了")
    end
  end
end
