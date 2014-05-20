# encoding : utf-8
module HomeHelper
  def weight_status blog
    "<span class='ding'>[顶]</span>" if blog.weight > 0
  end

  def display_content content
    raw strip_tags(content[0, 240]) + "......"
  end
end
