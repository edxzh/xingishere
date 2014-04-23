# encoding : utf-8
class CommentsController < ApplicationController
  layout false, only: :create
  def index
    @comments = Comment.published
  end

  def show
    @comment = Comment.published.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.content = params[:content]
    @comment.user_id = current_user.present? ? current_user.id : 0
    @comment.blog_id = params[:blog_id]

    if current_user.nil?
      render json: { status: -1, message: '只有登录后的用户才能评论哦！如果没有帐号点击右上角注册按钮！' } and return
    end

    if @comment.save
      @comments = Blog.published.find(params[:blog_id]).comments.published.page(params[:page]).per(10)
    end
  end

  def edit
    @comment = Comment.published.find(params[:id])
  end

  def update
    @comment = Comment.published.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to @comment, :notice  => "Successfully updated comment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url, :notice => "Successfully destroyed comment."
  end
end
