# encoding : utf-8
class AdminController < ApplicationController
  before_filter :is_admin
  def user_login
    if session[:user_id].blank?
      store_location
      flash[:info] = "请您先登录"
      redirect_to login_path
    end
  end

  def is_admin
    user = User.find(session[:user_id]) if session[:user_id].present?
    if !user || !user.admin?
      redirect_to '/404.html'
    end
  end
end
