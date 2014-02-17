# encoding : utf-8
namespace :add do
  desc  "通过邮箱地址给一个用户赋予管理员权限"
  task  :admin => :environment do
    email = ENV['email']
    user = User.where("email = ?", email)
    user.admin = 1
    user.save
  end
end
