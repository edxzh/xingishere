module MessagesHelper
  def show_message(message)
    if message.publish_status
      "<div class='message'>
          #{gravatar_for message.user}
          <div class='msg'>
            <p class='msg_name'>#{message.name}<span class='message_id'>第#{message.id}楼</span></p>
            <p class='msg_content'>#{ h message.content}</p>
            <p class='msg_time'>#{message.created_at.to_s(:db)}</p>
          </div>
        </div>"
    else
      "
        <div class='delete'><span>#{message.id}楼 来自 <span class='red'>#{message.name}</span> 的吐槽已删除</span></div>
      "
    end
  end
end
