# encoding: utf-8
class ActivateMailer < ActionMailer::Base
  default from: 'starzhou.com'
  helper ApplicationHelper

  def user_activate(user)
    @user         = user
    @subject      = '帐号激活'
    @to           = user.email
    mail to: @to, subject: @subject
  end
end
