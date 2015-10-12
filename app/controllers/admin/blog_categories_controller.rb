# encoding: utf-8
class Admin::BlogCategoriesController < AdminController
  layout 'admin'

  def index
    @blog_categories = BlogCategory.page(params[:page]).per(10)
  end

  def show
    @blog_category = BlogCategory.find(params[:id])
  end

  def new
    @blog_category = BlogCategory.new
  end

  def create
    @blog_category = BlogCategory.new(blog_category_params)
    if @blog_category.save
      redirect_to admin_blog_categories_path, success: "新增分类成功"
    else
      render 'new'
    end
  end

  def edit
    @blog_category = BlogCategory.find(params[:id])
  end

  def update
    @blog_category = BlogCategory.find(params[:id])
    if @blog_category.update_attributes(blog_category_params)
      redirect_to admin_blog_categories_path, success: "更新成功"
    else
      render 'edit'
    end
  end

  def destroy
    @blog_category = BlogCategory.find(params[:id])
    @blog_category.destroy

    redirect_to admin_blog_categories_path, success: "删除成功"
  end

  private

  def blog_category_params
    params.require(:blog_category).permit(:name)
  end
end
