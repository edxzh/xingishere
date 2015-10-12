namespace :admin do
  desc 'Grunt a user as administation'
  task add: :environment do
    email = ENV['email']
    logger = Logger.new(File.join(Rails.root, 'log', 'admin.log'))

    user = User.where("email = ?", email).first
    user.update_attribute!(:admin, true)

    logger.info "#{user.name} #{user.email} has be grunted as admin!!"
  end

  desc 'Generate default administrator'
  task generate: :environment do
    logger = Logger.new(File.join(Rails.root, 'log', 'admin.log'))

    user = User.new(
      email:                  'admin@admin.com',
      name:                   'admin',
      password:               '123456',
      password_confirmation:  '123456',
      admin:                  true
    )
    user.save!

    logger.info "Generate administrator successfully, email is #{user.email}, password is 123456"
    p "Generate administrator successfully, email is #{user.email}, password is 123456"
  end
end
