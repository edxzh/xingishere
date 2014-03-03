# encoding : utf-8
class UsersController < ApplicationController
  include SessionsHelper
  layout "account",       only: [:show]
  before_filter :user_login,    only: [:edit, :update, :show]
  before_filter :is_admin,  only: [:edit, :update, :show, :index]
  def index
    @users = User.page(params[:page]).per(10)# .padding(1)
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:page]).per(2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.activate_code = SecureRandom.hex 32       # 生成32位随机字符串
    if @user.save
      flash[:success] = "恭喜您注册成功，现在您可畅游所有服务"
      session[:user_id]     = @user.id
      session[:user_name]   = @user.name
      ActivateMailer.user_activate(@user)
      redirect_to success_users_path
    else
      render :action => 'new'
    end
  end

  def success
    @user = User.find(session[:user_id])
  end

  def activate
    user = User.where(email: params[:email]).first
    if user.present? && !user.active_status && user.activate_code == params[:activate_code]
      user.activate_status = true
      user.save
      flash[:success] = "恭喜您激活成功！"
    else
      flash[:error]   = "激活不成功，请检查地址链接是否复制错误"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, :notice  => "更新成功"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, :success => "删除成功"
  end
  private
end
