# encoding : utf-8
require 'spec_helper'

describe "测试访问一些静态页面" do
  describe "GET /static_pages" do
    it "测试访问主页" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/'
      expect(page).to have_content("主页")
      expect(page).to have_title("Edward Joy")
    end
    it "测试404界面" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/404.html'
      expect(page).to have_content("doesn't exist")
      expect(page).to have_title("页面找不到了")
    end
  end
end
