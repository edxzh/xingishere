class HomeController < ApplicationController
  skip_before_filter  :authorize
  def index
    @blogs = Blog.category(params[:category]).keyword(params[:keyword]).page(params[:page]).per(1)
  end
end
