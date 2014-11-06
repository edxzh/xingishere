# encoding: utf-8
module Admin::BlogsHelper
  def publish_text(blog)
    if blog.published?
      "#{link_to('取消发布', admin_blog_path(blog), method: :delete, data: { confirm: '确定取消发布？' })}"
    else
      "#{link_to('发布', admin_blog_path(blog), method: :delete, data: { confirm: '确定发布？' })}"
    end
  end
end
