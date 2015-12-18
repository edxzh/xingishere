class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_404_page
  protect_from_forgery with: :exception

  include SessionsHelper

  def authorize
    if User.find_by_id(session[:user_id]).blank?
      redirect_to user_login_path, alert: '请您先登录'
    end
  end

  def user_login
    if session[:user_id].blank?
      store_location
      flash[:info] = '请您先登录'
      redirect_to login_path
    end
  end

  def is_admin
    p 'X' * 100
    p current_user
    p current_user.admin?
    p 'h' * 100
    unless current_user && current_user.admin?
      render_404_page
    end
  end

  def render_404_page
    respond_to do |format|
      format.xml { render xml: { error: 'Not found' }, status: 404 }
      format.html { render template: 'errors/404', status: 404, layout: 'static' }
    end
  end
end
