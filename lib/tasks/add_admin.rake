# encoding : utf-8
namespace :add do
  desc  "通过邮箱地址给一个用户赋予管理员权限"
  task  :admin => :environment do
    email = ENV['email']
    logger = Logger.new(File.join(Rails.root, 'log', 'admin.log'))

    user = User.where("email = ?", email).first
    logger.info user.email
    logger.info "修改前的权限是：" + user.admin.to_s
    user.update_attribute(:admin, true)
    logger.info "修改后的权限是：" + user.admin.to_s
  end
end
