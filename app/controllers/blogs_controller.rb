class BlogsController < ApplicationController
  def index
    if params[:category].present?
      relation = Blog.published.weight_order.includes(:comments).category(params[:category])
    elsif params[:keyword]
      relation = Blog.published.weight_order.includes(:comments).keyword(params[:keyword])
    else
      relation = Blog.published.weight_order.includes(:blog_category, :comments)
    end
    @blogs = relation.group_by { |blog| blog.blog_category_id }
  end

  def show
    @blog = Blog.find_by_url_name!(params[:id])
    @like = false
    @blog.view_total = @blog.view_total += 1
    @blog.save
    @like = true if(current_user.present? && Blog.like_by_user?(current_user.id, @blog.id))

    @auth = false
    @auth = true if(current_user.present? && @blog.user_id == current_user.id)

    @comments = @blog.comments.page(params[:page]).per(10)
  end

  def user_like
    blog_id = params[:blog_id].to_i

    @blog = Blog.find(blog_id)
    if current_user.present?
      add_type = UserLove.change_status(current_user.id, blog_id)
      render json: { type: add_type, count: @blog.user_loves.count }
    else
      render json: { type: -1, count: @blog.user_loves.count + 1 }
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
