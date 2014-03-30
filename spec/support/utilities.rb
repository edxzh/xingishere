# encoding: utf-8
def full_title(page_title)
  base_title = "星's blog"
  if page_title.present?
    "#{page_title} | #{base_title}"
  else
    base_title
  end
end

def login(user, options={})
  session[:user_name] = user.name
  session[:user_id]   = user.id
end
