# encoding : utf-8
class AccountController < ApplicationController
  before_filter :user_login
  def profile
    @user = current_user
    @male = false
    @male = true if @user.present? && @user.sex = "male"
  end

  def update_pro
    @user = current_user
    birthday = params[:birthday] if params[:birthday].present?

    @user.assign_attributes({ sex: params[:sex], birthday: birthday, status_name: params[:status], height: params[:height] })
    if @user.save
      flash[:info] = "修改成功"
      redirect_to account_advanced_path
    else
      flash[:info] = "修改失败"
      redirect_to account_profile_path
    end
  end

  def advanced
    @user = current_user
  end

  def update_adv
    @user = current_user
    @user.assign_attributes({ position: params[:position], address: params[:address], relation_name: params[:relation_name], description: params[:description] })

    if @user.save
      flash[:info] = "更新成功"
      redirect_to user_path(id: session[:user_id])
    else
      flash[:info] = "更新失败"
      redirect_to account_advanced_path
    end
  end
end
