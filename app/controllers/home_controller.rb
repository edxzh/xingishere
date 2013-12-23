class HomeController < ApplicationController
  skip_before_filter  :authorize
  def index
    if params[:category]
      @blogs = Blog.category_find(params[:category]).page(params[:page]).per(1)
    elsif params[:keyword]
      @blogs = Blog.keyword(params[:keyword]).page(params[:page]).per(1)
    else
      @blogs = Blog.where("1 = 1").page(params[:page]).per(1)
    end
  end
end
