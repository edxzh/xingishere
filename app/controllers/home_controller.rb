class HomeController < ApplicationController
  skip_before_filter  :authorize
  def index
    @blogs     = Blog.published.page(params[:page]).per(10)
    @hot_blogs = Blog.published.order("view_total ASC, created_at DESC").limit(10)
  end
end
