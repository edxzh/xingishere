# encoding : utf-8
class SessionsController < ApplicationController
  include SessionsHelper
  def new

  end

  def create
    user = User.where("email = ?", params[:email].downcase).first
    if user && user.authenticate(params[:password])
      login user
      session[:user_name] = user.name
      session[:user_id] = user.id
      flash.now[:success] = "登录成功"
      redirect_back_or root_path
    else
      flash.now[:danger] = "登录失败,请检查邮件地址和密码"
      render 'new'
    end
  end
  def destroy
    session[:user_name] = nil
    session[:user_id]   = nil
    logout
    redirect_to root_path
  end

end
