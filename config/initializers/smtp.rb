Mywebsite::Application.configure do
  if Settings.present? && Settings.smtp.present?
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :authentication => :plain,
      :address        => "smtp.mailgun.org",
      :port           => 587,
      :domain         => "www.xingishere.com",
      :user_name      => "postmaster@xingishere.com",
      :password       => Settings.smtp_password,
    }
  end
end
