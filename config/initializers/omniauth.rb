Rails.application.config.middleware.use OmniAuth::Builder do
    provider :weibo, Settings.omniauth.key, Settings.omniauth.secret
end
