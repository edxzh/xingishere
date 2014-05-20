# encoding : utf-8
class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json

  layout false, only: :create
  def index
    @messages = Message.page(params[:page]).per(10)
    @message = Message.new

    if request.xhr?
      render layout: false
    end

  end

  # POST /messages
  # POST /messages.json
  def create
    # 前端发来ajax请求，只有一个参数content

    @message          = Message.new(content: params[:content])
    @message.user_id  = current_user.present? ? current_user.id : 0

    if current_user.nil?
      render json: {status: -1, message: '只有登录后的用户才能评论哦！如果没有帐号点击右上角注册按钮！'} and return
    end
    if @message.save
      @messages = Message.page(params[:page]).per(10)
    end

  end
end
