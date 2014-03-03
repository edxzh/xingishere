# encoding : utf-8
module MessagesHelper
  def show_message(message)
    if message.publish_status
      "<div class='message'>
          <img src='/images/50.jpg' alt='' />
          <div class='msg'>
            <p class='msg_name'>#{message.name}<span class='message_id'>第#{message.id}楼</span></p>
            <p class='msg_content'>#{h message.content}</p>
            <p class='msg_time'>#{format_time(message.created_at)}</p>
          </div>
        </div>"
    else
      "
        <div class='delete'><span>#{message.id}楼 来自 <span class='red'>#{message.name}</span> 的吐槽已删除</span></div>
      "
    end
  end
end
