# encoding : utf-8
class AdminController < ApplicationController
  before_filter :is_admin
  def user_login
    if cookies[:remember_token].blank?
      store_location
      flash[:info] = "请您先登录"
      redirect_to login_path
    end
  end

  def is_admin
    user = User.find(cookies[:remember_token]) if cookies[:remember_token].present?
    if !user || !user.admin?
      redirect_to '/404.html'
    end
  end
end
