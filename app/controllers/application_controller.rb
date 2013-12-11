# encoding : utf-8
class ApplicationController < ActionController::Base
  # before_filter :authorize
  protect_from_forgery with: :exception
  include SessionsHelper
  def authorize
    if User.find_by_id(session[:user_id]).blank?
      redirect_to user_login_path, alert: "请您先登录"
    end
  end
end
