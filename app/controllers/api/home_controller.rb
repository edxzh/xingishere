# encoding: utf-8
class Api::HomeController < ApiController
  def index
    @blogs    = Blog.published.includes(:blog_category, :tags).weight_order.page(params[:page]).per(10)
    @count    = Blog.published.count
  end
end
