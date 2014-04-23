# encoding : utf-8
class BlogsController < ApplicationController
  before_filter :is_admin,      only: [:edit, :update, :new, :create]
  def index
    if params[:category].present?
      @blogs = Blog.published.category(params[:category]).page(params[:page]).per(10)
    elsif params[:keyword]
      @blogs = Blog.published.keyword(params[:keyword]).page(params[:page]).per(10)
    else
      @blogs = Blog.published.page(params[:page]).per(10)
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @like = false                   # 当前用户是否喜欢此博客
    @blog.view_total = @blog.view_total += 1
    @blog.save
    @like = true if (current_user.present? && Blog.like_by_user?(current_user.id, @blog.id))

    @auth = false # 用户是否有权限操作此博客
    @auth = true if current_user.present? && @blog.user_id == current_user.id

    @comments = @blog.comments.page(params[:page]).per(10)
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
    @blog     = Blog.find(params[:id])
    @category = BlogCategory.all
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
    @blog.destroy
    redirect_to blogs_url, :notice => "Successfully destroyed blog."
  end

  def user_like
    blog_id = params[:blog_id].to_i

    @blog = Blog.find(blog_id)
    if current_user.present?
      add_type = UserLove.add(current_user.id, blog_id)
      render json: { type: add_type, count: @blog.loves_count }
    else
      render json: { type: -1, count: @blog.loves_count+1 }
    end
  end

  def add_category
    name = params[:blog_category_name]
    blog_category = BlogCategory.new(name: name)
    if blog_category.save
      render json: { status: 1, id: blog_category.id, name: blog_category.name }
    else
      render json: { status: 0 }
    end
  end
end
