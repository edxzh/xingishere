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

  desc  "给当前的每个用户生成一个记忆权标"
  task  generate_remember_token:  :environment do
    logger = Logger.new(Rails.root.join('tmp', 'generate_remember_token.log'))

    logger.info("开始导入，时间为:#{Time.now.to_s(:db)}")
    users = User.activated
    users.each do |user|
      user.remember_token = SecureRandom.urlsafe_base64
      if user.save
        logger.info "导入用户#{user.name}"
      end
    end

    logger.info("导入结束，时间为:#{Time.now.to_s(:db)}")
  end
end
