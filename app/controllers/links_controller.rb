# encoding : utf-8
class LinksController < ApplicationController
  layout  'links'
  # GET /links
  # GET /links.json
  def index
    @links = Link.includes(:link_category).group_by { |link| link.link_category_id }
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @links }
    end
  end
end
