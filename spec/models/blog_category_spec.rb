# encoding: utf-8
require 'rails_helper'

describe BlogCategory do
  before(:each) do
    @blog_category = FactoryGirl.create(:blog_category)
  end

  subject { @blog_category }

  describe "模型校验" do
    it "必须存在类别名" do
      @blog_category.name = ""
      expect(@blog_category).not_to be_valid
    end
    it "类别名不能重复" do
      @blog_category_with_same_name = @blog_category.dup
      expect(@blog_category_with_same_name).not_to be_valid
    end
  end
end
