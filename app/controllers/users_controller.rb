# encoding : utf-8
class UsersController < ApplicationController
  include SessionsHelper
  before_filter :user_login,    only: [:edit, :update, :show]
  before_filter :correct_user,  only: [:edit, :update, :show]
  before_filter :is_admin,      only: [:index]
  def index
    @users = User.page(params[:page]).per(10)# .padding(1)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "恭喜您注册成功，现在您可畅游所有服务"
      session[:user_id]     = @user.id
      session[:user_name]   = @user.name
      redirect_to @user
    else
      render :action => 'new'
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
    def user_login
      if session[:user_id].blank?
        store_location
        flash[:notice] = "请您先登录"
        redirect_to login_path
      end
    end
    def correct_user
      user = User.find(params[:id])
      if user.id != session[:user_id]
        flash[:notice] = "您无权查看"
        redirect_to root_path
      end
    end
    def is_admin
      user = User.find(session[:user_id])
      if user.blank? || !user.admin?
        redirect_to '/404.html'
      end
    end
end
