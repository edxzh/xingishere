# encoding : utf-8
class SessionsController < ApplicationController
  include SessionsHelper
  def new

  end

  def auth
   Rails.logger.debug request.env["omniauth.auth"]
  end

  def create
    user = User.where("email = ?", params[:email].downcase).first
    if user && user.authenticate(params[:password])
      login user
      flash.now[:success] = "登录成功"
      if params[:remeber] == "1"
        cookies[:email] = { value: user.email, expires: 1.year.from_now }
        cookies[:password] = { value: params[:password], expires: 1.year.from_now }
      end
      redirect_back_or root_path
    else
      flash.now[:danger] = "登录失败,邮箱或密码错误"
      render 'new'
    end
  end

  def destroy
    cookies.delete  :remember_token
    logout
    redirect_to root_path
  end

end
