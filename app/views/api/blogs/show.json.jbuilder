json.title @blog.title
json.content @blog.content
json.created_at @blog.created_at
json.comments @blog.comments do |comment|
  json.avatar gravatar_for comment.user
end
