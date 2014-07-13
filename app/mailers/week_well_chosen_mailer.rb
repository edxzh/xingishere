# encoding: utf-8
def WeekWellChosenMailer < ActivateMailer::Base
  default from: "www.xingishere.com"

  def week_blogs(blogs, user)
    @blogs      = blogs
    @subject    = "撕瓦星哥每周精选"
    @to         = user.email
    mail to: @to, subject: @subject
  end
end
