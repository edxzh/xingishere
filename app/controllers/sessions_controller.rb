# encoding : utf-8
class SessionsController < ApplicationController
  def new
    
  end
  def create
    user = User.where("username = ?", params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_name] = user.name
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:error] = "登录失败"
      render 'new'
    end
  end
  def destroy

  end

end
