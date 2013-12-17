# encoding : utf-8
module ApplicationHelper
  def full_title(page_title)
    base_title = "星哥's blog"
    if page_title.present?
      "#{page_title} | #{base_title}"
    else
      base_title
    end
  end

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    gravatar_id   = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url  = "http://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def format_time(time)
    time.strftime("%Y-%m-%d %H:%M:%S")
  end
end
