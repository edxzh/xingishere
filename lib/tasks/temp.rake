# encoding: utf-8
namespace :do do
  desc  "把有效用户的email导入到订阅邮箱"
  task  :export_user_email_to_subscribe => :environment do
    logger = Logger.new(Rails.root.join('tmp', 'subscribe_init.log'))
    emails = User.activated.pluck("email")

    logger.info("开始导入")
    emails.each do |email|
      s = Subscribe.new(email: email)
      if s.save
        logger.info("导入成功: #{email}")
      end
    end
    logger.info("导入结束")
  end
end
