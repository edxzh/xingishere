# encoding: utf-8
class Api::BlogsController < ApiController
  def index
    if params[:category].present?
      relation = Blog.published.includes(:comments).category(params[:category])
    elsif params[:keyword]
      relation = Blog.published.includes(:comments).keyword(params[:keyword])
    else
      relation = Blog.published.includes(:blog_category, :comments)
    end
    order = params[:order] == "hottest" ? "view_total" : "created_at"
    @blogs        = relation.order("#{order} DESC").page(params[:page]).per(10)
    @total_count  = relation.count
  end

  def show
    @blog = Rails.cache.fetch("/api/blog/#{params[:id]}", expires_in: 60.minutes) do
      Blog.find_by_url_name(params[:id])
    end
    @comments = @blog.comments.page(params[:page]).per(10)
  end

  def categories
    @blog_category = BlogCategory.all
  end
end
