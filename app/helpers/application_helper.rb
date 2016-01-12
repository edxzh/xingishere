module ApplicationHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user, options = { size: 50 })
    images = %w(qq1.jpg qq2.jpg qq3.jpg)
    default_image = images.sample
    return image_tag("/images/#{default_image}", class: "gravatar", size: "50x50") if user.nil?

    size = options[:size]
    image_tag(avatar_url(user, size), alt: user.name, class: "gravatar")
  end

  def avatar_url(user, size = 50)
    gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
    "http://secure.gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end

  def options_for_select_status(selected = nil)
    options = []
    I18n.t('user.status').each do |k, v|
      options << [v, k]
    end
    options_for_select(options, selected)
  end

  def options_for_select_relation(selected = nil)
    options = []
    I18n.t('user.relation').each do |k, v|
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
    Blog.published.order('view_total ASC, created_at DESC').limit(10)
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
    raw '<ul>
      <li>会员个数：#{User.count}</li>
      <li>文章个数：#{Blog.published.count}</li>
      <li>留言个数：#{Message.count}</li>
    </ul>'
  end

  def render_ga
    if Rails.env.production?
      render 'shared/ga'
    end
  end
end
