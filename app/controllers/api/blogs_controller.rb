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
end
