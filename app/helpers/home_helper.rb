# encoding : utf-8
module HomeHelper
  def weight_status blog
    "<span class='ding'>[顶]</span>" if blog.weight > 0
  end
end
