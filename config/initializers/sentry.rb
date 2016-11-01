Raven.configure do |config|
  config.dsn = ENV['sentry_token']
  config.environments = ['production']
end
