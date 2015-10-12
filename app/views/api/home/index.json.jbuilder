json.count @count
json.blogs @blogs.each do |blog|
  json.title          blog.title
  json.blog_url       blog_url(blog)
  json.category_blogs blogs_url(category: blog.blog_category_id)
  json.content        display_content(blog.content)
  json.category_name  blog.blog_category_name
  json.view_total     blog.view_total
  json.created_at     blog.created_at.to_s(:db)
end
