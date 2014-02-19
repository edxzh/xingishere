# encoding : utf-8
module BlogsHelper
  def like_icon
    if @like
      raw '<span class="glyphicon glyphicon-heart" id="like_icon"></span>'
    else
      raw '<span class="glyphicon glyphicon-heart-empty" id="like_icon"></span>'
    end
  end

  def weight_status_index blog
    "<span class='ding_blogs'>[顶]</span>" if blog.weight > 0
  end
end
