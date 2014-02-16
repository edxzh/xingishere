class HomeController < ApplicationController
  skip_before_filter  :authorize
  def index
    @blogs     = Blog.page(params[:page]).per(5)
    @hot_blogs = Blog.order("view_total ASC, created_at DESC").limit(10)
  end
end
