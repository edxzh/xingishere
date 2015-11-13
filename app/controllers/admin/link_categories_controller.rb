class Admin::LinkCategoriesController < AdminController
  def index
    @link = LinkCategory.all
  end

  def new
    @link = LinkCategory.new
  end

  def create
    name = params[:link_category_name]
    link_category = LinkCategory.new(category: name, user_id: current_user.id)
    if link_category.save
      render json: { status: 1, id: link_category.id, name: link_category.category }
    else
      render json: { status: 0 }
    end
  end
end
