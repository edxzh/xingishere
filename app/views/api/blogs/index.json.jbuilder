json.total_count @total_count
json.blogs @blogs do |blog|
  json.title          blog.title
  json.blog_url       blog_url(blog)
  json.category_name  blog.blog_category_name
  json.category_blogs blogs_url(category: blog.blog_category_id)
  json.created_at     blog.created_at.to_s(:db)
  json.view_total     blog.view_total
  json.comments_count blog.comments.count
end
