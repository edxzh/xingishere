class HomeController < ApplicationController
  layout 'home'
  skip_before_filter  :authorize
  def index
    @blogs     = Blog.published.includes(:blog_category, :tags).weight_order.page(params[:page]).per(5)
  end
end
