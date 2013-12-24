# encoding : utf-8
class LinksController < ApplicationController
  before_filter :is_admin,      only: [:edit, :update, :new, :create]
  layout  'links'
  # GET /links
  # GET /links.json
  def index
    @link_category = LinkCategory.all
    @links = Link.all

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
    @category = LinkCategory.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
  end

  # POST /links
  # POST /links.json
  def create
    title       = params[:title]
    href        = params[:href]
    category_id = params[:category].to_i

    link = Link.new(title: title, href: href, link_category_id: category_id)

    respond_to do |format|
      if link.save
        format.html { redirect_to link, notice: 'Link was successfully created.' }
        format.json { render json: link, status: :created, location: link }
      else
        format.html { render action: "new" }
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
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
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
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end
end
