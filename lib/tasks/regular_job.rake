namespace :regular_job do
  desc  '每周日晚上21:30给订阅的用户发邮件'
  task  :send_week_chosen => :environment do
    logger = Logger.new(Rails.root.join('tmp', 'week_chosen.log'))
    logger.info(Time.now.to_s)
    logger.info('邮件发送开始')

    Subscribe.pluck('email').each do |email|
      logger.info(email)
      WeekWellChosenMailer.deliver_week_blogs(email).deliver_now
    end
    logger.info('邮件发送结束')
  end
end
