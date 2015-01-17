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

  def show_comment(comment, index)
    if comment.publish_status
      "<div class='comment'>
          #{gravatar_for comment.user}
          <div class='cmt'>
            <p class='cmt_name'>#{comment.name}<span class='cmt_id'>第#{index + 1}楼</span></p>
            <p class='cmt_content'>#{h comment.content}</p>
            <p class='cmt_time'>#{comment.created_at.to_s(:db)}</p>
          </div>
        </div>"
    else
      "
        <div class='delete'><span>#{comment.id}楼 来自 <span class='red'>#{comment.name}</span> 的吐槽已删除</span></div>
      "
    end
  end

end
