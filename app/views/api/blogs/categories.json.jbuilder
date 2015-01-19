json.categories @blog_category.each do |blog_category|
  json.name blog_category.name
  json.url  blogs_url(category: blog_category.id)
end
