# encoding: utf-8
class Admin::MessagesController < AdminController
  layout 'admin'
  def index
    @messages = Message.page(params[:page]).per(10)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.publish_status = false
    if @message.save
      redirect_to admin_messages_path, success: "取消发布成功"
    else
      redirect_to admin_messages_path, success: "发布失败"
    end
  end
end
