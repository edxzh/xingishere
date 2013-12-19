# encoding : utf-8
class BlogsController < ApplicationController
  before_filter :is_admin,      only: [:edit, :update, :new, :create]
  def index
    if params[:category].present?
      @blogs = Blog.category(params[:category])
    else
      @blogs = Blog.all
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @auth = @blog.user_id == current_user(:id)? ? true : false
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog])
    @blog.user_id = session[:user_id]
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
    @blog.destroy
    redirect_to blogs_url, :notice => "Successfully destroyed blog."
  end
end
