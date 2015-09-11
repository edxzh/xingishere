# encoding: utf-8
class WeekWellChosenMailer < ActionMailer::Base
  default from: "www.xingishere.com"
  helper  HomeHelper
  helper  ApplicationHelper

  def week_blogs(email)
    @blogs      = Blog.published.order("created_at DESC").limit(5)
    category_ids =  BlogCategory.pluck("id")
    ran_category_ids = category_ids.sample(4)
    @blog_categories = BlogCategory.find(ran_category_ids)
    user_ids = User.activated.pluck("id")
    ran_user_ids = user_ids.sample(4)
    @users = User.find(ran_user_ids)
    @subject    = "starzhou每周精选"
    @to         = email
    mail to: @to, subject: @subject
  end
end
