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
      redirect_back_or user
    else
      flash.now[:error] = "登录失败"
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
