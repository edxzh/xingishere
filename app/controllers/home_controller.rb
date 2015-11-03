class HomeController < ApplicationController
  layout 'home'
  skip_before_action :authorize

  def index
    @blogs = Blog.published.includes(:blog_category, :tags).weight_order.page(params[:page]).per(10)
  end
end
