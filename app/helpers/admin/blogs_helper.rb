module Admin::BlogsHelper
  def publish_text(blog)
    if blog.published?
      "#{link_to('取消发布', toggle_publish_status_admin_blog_path(blog), method: :post, data: { confirm: '确定取消发布？' })}"
    else
      "#{link_to('发布', toggle_publish_status_admin_blog_path(blog), method: :post, data: { confirm: '确定发布？' })}"
    end
  end
end
