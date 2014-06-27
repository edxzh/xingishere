# encoding: utf-8
class Admin::LinksController < AdminController
  layout  'admin'
  # GET /links
  # GET /links.json
  def index
    @links = Link.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/new
  # GET /links/new.json
  def new
    @link = Link.new
    @category = LinkCategory.where(user_id: current_user.id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
    @category = LinkCategory.where(user_id: current_user.id)
  end

  # POST /links
  # POST /links.json
  def create
    link = Link.new(params[:link])

    respond_to do |format|
      if link.save
        format.html { redirect_to admin_links_path, success: '创建成功' }
        format.json { render json: link, status: :created, location: link }
      else
        format.html { render "new" }
        format.json { render json: link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.json
  def update
    @link = Link.find(params[:id])

    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to admin_links_path, success: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render "edit" }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to admin_links_path, info: "删除成功"  }
      format.json { head :no_content }
    end
  end
end
