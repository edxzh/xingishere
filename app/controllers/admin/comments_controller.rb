# encoding: utf-8
class Admin::CommentsController < AdminController
  layout 'admin'

  def index
    @comments = Comment.page(params[:page]).per(10)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.publish_status = false
    if @comment.save
      redirect_to admin_comments_path, success: "取消发布成功"
    else
      redirect_to admin_comments_path, success: "取消发布失败"
    end
  end
end
