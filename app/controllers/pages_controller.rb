class PagesController < ApplicationController
  layout  "static"
  def about
    render layout: false
  end
  def resume
  end
  def xingge
    render layout: false
  end
  def api
  end
end
