module BlogsHelper
  def like_icon
    if @like
      raw '<span class="glyphicon glyphicon-heart" id="like_icon"></span>'
    else
      raw '<span class="glyphicon glyphicon-heart-empty" id="like_icon"></span>'
    end
  end
end
