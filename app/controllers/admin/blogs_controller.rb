class Admin::BlogsController < AdminController
  layout 'admin'

  def index
    @blogs = Blog.where("title like ?", "%#{params[:title]}%").weight_order.page(params[:page]).per(10)
    @category = BlogCategory.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
    @category = BlogCategory.all
  end

  def create
    if current_user.blogs.create(blog_params)
      redirect_to admin_blogs_path, success: "发表成功"
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find_by_url_name(params[:id])
    @category = BlogCategory.all
  end

  def update
    @blog = Blog.find_by_url_name(params[:id])
    if @blog.update_attributes(blog_params)
      redirect_to admin_blogs_path, success: "更新成功"
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find_by_url_name(params[:id])
    if @blog.publish_status?
      @blog.update_attributes(publish_status:  false)
    else
      @blog.update_attributes(publish_status:  true)
    end

    if @blog.save
      redirect_to admin_blogs_url, success: "删除成功"
    else
      redirect_to admin_blogs_url, danger: "删除失败"
    end
  end

  def toggle_publish_status
    @blog = Blog.find_by_url_name(params[:id])
    if @blog.publish_status?
      @blog.update_attributes(publish_status:  false)
    else
      @blog.update_attributes(publish_status:  true)
    end

    if @blog.save
      redirect_to admin_blogs_url, success: "删除成功"
    else
      redirect_to admin_blogs_url, danger: "删除失败"
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content, :blog_category_id, :weight, :publish_status, :seo_keyword, :url_name)
  end
end
