# encoding : utf-8
class UserController < ApplicationController
  skip_before_filter  :authorize

  def zhuce
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    if @user.save
      redirect_to users_path
    else
      redirect_to user_login_path
    end
  end

  def login
    if request.post?
      user = User.authenticate(params[:username], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to users_path
      else
        redirect_to user_login_path, alert: "用户名或密码错误"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to user_login_path
  end
end
