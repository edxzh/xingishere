# encoding: utf-8
namespace :regular_job do
  desc  "每周日晚上21:30给订阅的用户发邮件"
  task  :send_week_chosen => :environment do
    emails = User.activated.select("email")
    emails.each do |email|
      WeekWellChosenMailer.week_blogs(email)
    end
  end
end
