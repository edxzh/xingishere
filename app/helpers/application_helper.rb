# encoding : utf-8
module ApplicationHelper
  def full_title(page_title)
    base_title = "星's blog"
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

  def options_for_select_status(selected = nil)
    options = []
    I18n.t("user.status").each do |k, v|
      options << [v, k]
    end
    options_for_select(options, selected)
  end

  def options_for_select_relation(selected = nil)
    options = []
    I18n.t("user.relation").each do |k, v|
      options << [v, k]
    end
    options_for_select(options, selected)
  end

  def display_birth(date)
    if date.present? && date > Date.parse('1970-01-01')
      date
    end
  end

  def hot_blogs
    Blog.order("view_total ASC, created_at DESC").limit(10)
  end

  def all_category
    BlogCategory.all
  end

  def tips
    if Tip.count > 0
      random_id = rand(Tip.first.id..Tip.count)
      loop do
        tip = Tip.find(random_id)
        return tip.content if tip.present?
        random_id = (Tip.first.id..Tip.count)
      end
    end
  end

  def statistics
    raw "<ul>
      <li>会员个数：#{User.count}</li>
      <li>文章个数：#{Blog.count}</li>
      <li>留言个数：#{Message.count}</li>
    </ul>"
  end
end
