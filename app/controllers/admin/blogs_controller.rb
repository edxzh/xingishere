# encoding : utf-8
class Admin::BlogsController < AdminController
  layout 'admin'
  # before_filter :is_admin
  def index
    @blogs = Blog.published.page(params[:page]).per(10)
    # if params[:category].present?
    #   @blogs = Blog.category(params[:category]).page(params[:page]).per(10)
    # elsif params[:keyword]
    #   @blogs = Blog.keyword(params[:keyword]).page(params[:page]).per(10)
    # else
    #   @blogs = Blog.page(params[:page]).per(10)
    # end
  end

  def show
    @blog = Blog.find(params[:id])
    @like = false                   # 当前用户是否喜欢此博客
    @blog.view_total = @blog.view_total += 1
    @blog.save
    @like = true if (current_user.present? && Blog.like_by_user?(current_user.id, @blog.id))

    @auth = false # 用户是否有权限操作此博客
    @auth = true if current_user.present? && @blog.user_id == current_user.id
  end

  def new
    @blog = Blog.new
    @category = BlogCategory.all
  end

  def create
    @blog                   = Blog.new(params[:blog])
    @blog.user_id           = session[:user_id]
    @blog.blog_category_id  = params[:category].to_i
    if @blog.save
      redirect_to @blog, :notice => "发表成功"
    else
      render :action => 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      redirect_to @blog, :notice  => "更新成功"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.update_attributes(publish_status:  true)
    if @blog.save
      redirect_to admin_blogs_url, :notice => "删除成功"
    else
      redirect_to admin_blogs_url, :notice => "删除失败"
    end
  end

end
