class Api::LinksController < ApiController
  def index
    @links = Link.includes(:link_category).all
  end
end
