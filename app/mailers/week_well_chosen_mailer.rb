class WeekWellChosenMailer < ActionMailer::Base
  default from: 'postmaster@xingishere.com'
  helper  ApplicationHelper

  def deliver_week_blogs(email)
    @blogs              = Blog.published.order('created_at DESC').limit(5)
    @blog_categories    = BlogCategory.find(BlogCategory.pluck('id').sample(4))
    @users              = User.find(User.activated.pluck('id').sample(4))
    @subject            = 'starzhou每周精选'
    @to                 = email
    mail to: @to, subject: @subject
  end
end
