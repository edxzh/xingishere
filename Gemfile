source 'https://rubygems.org'
#source 'http://ruby.taobao.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'rails_config', '~> 0.3.1'
gem 'dalli'

gem 'rails_kindeditor'

gem 'carrierwave'
gem 'carrierwave-mongoid'
gem 'mini_magick', '~> 3.4'
gem 'mongo', '1.8.0'
gem 'mongoid', '~> 3.1.4'
gem 'bson', '1.8.0'
gem 'bson_ext', '1.8.0'
gem 'piet'
gem 'spreadsheet'
gem 'migration_comments'
gem 'roo'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.0.1'

gem 'whenever'
gem 'mechanize', '~> 2.5.1'
gem 'chinese_pinyin'
gem 'acts_as_list', '~> 0.1.8'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
#  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'kaminari'

gem 'typhoeus', '~> 0.6.1', require: false

# mail
# gem 'mail', '~> 2.5.4'
gem 'rest-client', '~> 1.6.7'
# gem 'multimap', '~> 1.1.2'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano', require: false
# gem 'capistrano-rvm'
gem 'rvm-capistrano'
gem 'rails_best_practices'
gem 'annotate', ">=2.6.0"

gem 'colorize'

gem "omniauth"
gem 'omniauth-weibo-oauth2'

# To use debugger
# gem 'debugger'

group :development do
  gem 'rubocop'
  gem 'quiet_assets'
  gem 'awesome_print'
  gem 'nifty-generators'
end

# TODO add guard and spork

group :test, :development do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'database_cleaner'
  gem 'capybara'
end

gem 'mocha', :group => :test, :require => false
gem 'simple_form'

group :development do
  gem 'capistrano-conditional', :require => false # <-- This is important!
end

group :production do
  gem 'newrelic_rpm'
end
