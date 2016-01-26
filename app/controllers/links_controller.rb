class LinksController < ApplicationController
  def index
    @links = Link.includes(:link_category).group_by(&:link_category_id)
  end
end
