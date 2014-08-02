# encoding: utf-8
class WeekWellChosenMailer < ActionMailer::Base
  default from: "www.xingishere.com"
  helper  HomeHelper
  helper  ApplicationHelper

  def week_blogs(email)
    @blogs      = Blog.published.order("view_total ASC, created_at DESC").limit(5)
    @subject    = "撕瓦星哥每周精选"
    @to         = email
    mail to: @to, subject: @subject
  end
end
