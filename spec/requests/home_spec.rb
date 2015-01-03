# encoding: utf-8
require 'spec_helper'

describe "首页" do
  before(:each) do
    visit root_path
  end
  subject { page }
  it { should have_content("where better happens") }
  it { should have_content("Edward_mjz@hotmail.com") }

  describe "邮件订阅功能" do

    describe "订阅成功" do
      before(:each) do
        fill_in "sub_email",      with: "11111111@qq.com"
        click_button "sub_submit"
      end

    end

  end
end
