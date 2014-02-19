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
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @messages }
#    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    # 前端发来ajax请求，只有一个参数content

    @message          = Message.new(content: params[:content])
    @message.user_id  = current_user.present? ? current_user.id : 0

    if @message.save
      @messages = Message.page(params[:page]).per(10)
    end

    # respond_to do |format|
    #   if @message.save
    #     format.html { redirect_to messages_path, success: '发表成功' }
    #     format.json { render json: @message, status: :created, location: @message }
    #   else
    #     format.html { render action: messages_path }
    #     format.json { render json: @message.errors, status: :error }
    #   end
    # end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
