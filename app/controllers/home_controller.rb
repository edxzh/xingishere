class HomeController < ApplicationController
  skip_before_filter  :authorize
  def index
    @blogs = Blog.where("user_id = ?", session[:user_id])
  end
end
