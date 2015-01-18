# encoding: utf-8
require 'spec_helper'
describe Api::HomeController do
  before(:each) do
    @blog               = FactoryGirl.create(:blog)
  end
  describe "index" do
    it "获取首页数据" do
      get :index
      expect(response.body).to eq({
        "count" => 2,
          {
            "title"           =>  @blog.title,
            "blog_url"        =>  blog_url(@blog),
            "category_blogs"  =>  blogs_url(category: @blog.blog_category_id),
            "content"         =>  display_content(@blog.content),
            "category_name"   =>  @blog.blog_category_name,
            "view_total"      =>  @blog.view_total,
            "created_at"      =>  @blog.created_at.to_s(:db)
          }
      }.to_json)
    end
  end
end
