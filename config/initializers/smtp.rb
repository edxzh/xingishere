Mywebsite::Application.configure do
  if Settings.present? && Settings.smtp.present?
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      authentication: :plain,
      address:        Settings.smtp.address,
      port:           Settings.smtp.port,
      domain:         Settings.smtp.domain,
      user_name:      Settings.smtp.user_name,
      password:       Settings.smtp.password,
    }
  end
end
