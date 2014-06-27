# encoding : utf-8
class CommentsController < ApplicationController
  layout false, only: :create
  def index
    @comments = Comment.published
  end

  def create
    @comment = Comment.new({ content: params[:content], blog_id: params[:blog_id], user_id: user_id })
    user_id = current_user.present? ? current_user.id : 0

    if current_user.nil?
      render json: { status: -1, message: '只有登录后的用户才能评论哦！如果没有帐号点击右上角注册按钮！' } and return
    end

    if @comment.save
      @comments = Blog.published.find(params[:blog_id]).comments.published.page(params[:page]).per(10)
    end
  end

end
