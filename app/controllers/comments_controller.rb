class CommentsController < ApplicationController
  layout false, only: :create
  def index
    @comments = Comment.published.order('created_at DESC')
  end

  def create
    user_id   = current_user.nil? ? 0 : current_user.id
    nickname  = params[:nickname] || current_user.name
    email     = params[:email] || current_user.email
    remote_ip = request.remote_ip

    @comment  = Comment.new({
      content:    params[:content],
      blog_id:    params[:blog_id],
      user_id:    user_id,
      nickname:   nickname,
      email:      email,
      remote_ip:  remote_ip
    })

    if @comment.save
      @comments = Blog.published.find(params[:blog_id]).comments.published.page(params[:page]).per(10)
    else
      render json: { status: -1, message: @comment.errors.messages.values }
    end
  end
end
