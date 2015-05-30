# encoding : utf-8
class CommentsController < ApplicationController
  layout false, only: :create
  # before_filter :user_validate, only: :create
  def index
    @comments = Comment.published.order('created_at DESC')
  end

  def create
    user_id = current_user.present? ? current_user.id : 0
    @comment = Comment.new({ content: params[:content], blog_id: params[:blog_id], user_id: user_id })

    if @comment.save
      @comments = Blog.published.find(params[:blog_id]).comments.published.order('created_at DESC').page(params[:page]).per(10)
    end
  end

private
  def user_validate
    if current_user.nil?
      render json: { status: -1, message: '只有登录后的用户才能评论哦！如果没有帐号点击右上角注册按钮！' } and return
    elsif current_user.activate_status == false
      render json: { status: -1, message: '请您先到注册邮箱中激活账号再进行其它操作！' } and return
    end
  end

end
