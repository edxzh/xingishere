# encoding : utf-8
class UsersController < ApplicationController
  include SessionsHelper
  layout 'account',       only: [:show]
  before_filter :user_login,    only: [:update, :show]
  before_filter :is_admin,  only: [:update, :index]

  def index
    @users = User.page(params[:page]).per(10)# .padding(1)
  end

  def show
    @user       = User.find(params[:id])
    @blogs      = @user.blogs.published.page(params[:page]).per(2)
    @love_blogs = @user.love_blogs.page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.activate_code = SecureRandom.hex 32
    if @user.save
      flash[:success] = '恭喜您注册成功，现在您可畅游所有服务'
      session[:user_id] = @user.id
      ActivateMailer.user_activate(@user).deliver_now
      redirect_to success_users_path
    else
      render 'new'
    end
  end

  def success
    if current_user.blank?
      flash[:danger] = '请您注册并登录'
      redirect_to root_path
    end
  end

  def activate
    user = User.where(email: params[:email]).first
    if user.present? && !user.activate_status && user.activate_code == params[:activate_code]
      user.activate_status = true
      user.save
      flash[:success] = '恭喜您激活成功！'
    elsif user.present? && user.activate_status
      flash[:danger] = '您的帐号已经处于激活状态'
    else
      flash[:danger] = '激活不成功，请检查地址链接是否复制错误'
    end
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url, success: '删除成功'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
