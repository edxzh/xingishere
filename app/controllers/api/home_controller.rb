# encoding: utf-8
class Api::HomeController < ApiController
  def index
    @blogs    = Blog.published.includes(:blog_category, :tags).weight_order.page(params[:page]).per(10)
    @count    = Blog.published.count
  end

  def nav
    @nav = [
      { name: "主页",     url: root_url },
      { name: "博客",     url: blogs_url },
      { name: "吐槽",     url: messages_url },
      { name: "友情链接", url: links_url },
      { name: "关于本站", url: about_url }
    ]
  end

end
