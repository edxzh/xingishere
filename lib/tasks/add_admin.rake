namespace :admin do
  desc 'Grunt a user as administation'
  task add: :environment do
    email = ENV['email']
    logger = Logger.new(File.join(Rails.root, 'log', 'admin.log'))

    user = User.where("email = ?", email).first
    user.update_attribute!(:admin, true)

    logger.info "#{user.name} has be grunted as admin!!"
  end
end
