class Api::BlogsController < ApiController
  def index
    if params[:category].present?
      relation = Blog.published.weight_order.includes(:comments).category(params[:category])
    elsif params[:keyword]
      relation = Blog.published.weight_order.includes(:comments).keyword(params[:keyword])
    else
      relation = Blog.published.weight_order.includes(:blog_category, :comments)
    end
    @blogs        = relation.page(params[:page]).per(10)
    @total_count  = relation.count
  end

  def show
    @blog = Rails.cache.fetch("/api/blog/#{params[:id]}", expires_in: 60.minutes) do
      Blog.find_by_url_name(params[:id])
    end
  end
end
