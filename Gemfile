source 'http://rubygems.org'
#source 'http://ruby.taobao.org'

gem 'rails', '4.2.1'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2', '~> 0.3.18'
gem 'rails_config', '~> 0.3.1'
gem 'dalli'

gem 'carrierwave'
gem 'carrierwave-mongoid'
gem 'mini_magick', '~> 3.4'
gem 'mongoid'
gem 'spreadsheet'
gem 'migration_comments'

gem 'gemoji'

gem 'ckeditor'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '3.1.2'

# redis
gem "hiredis", "~> 0.4.0"
gem "redis", ">= 2.2.0", :require => ["redis", "redis/connection/hiredis"]
gem 'redis-objects'
gem 'redis-namespace'

gem 'whenever'
gem 'mechanize', '~> 2.5.1'
gem 'chinese_pinyin'
gem 'acts_as_list', '~> 0.1.8'
# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails',   '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'uglifier', '>= 1.0.3'

gem 'turbolinks'
gem 'sdoc', '~> 0.4.0', group: :doc

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
#  gem 'therubyracer', :platforms => :ruby


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

gem 'rails_best_practices'
gem 'annotate'

gem 'colorize'

gem 'omniauth'
gem 'harmonious_dictionary'

group :development do
  gem 'cane'
  gem 'rubocop'
  gem 'brakeman', require: false
  gem 'quiet_assets'
  gem 'awesome_print'
  gem 'byebug', require: false
end

group :test, :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'rspec-its'
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'simplecov'
  gem 'mocha', require: false
end

group :production do
  gem 'newrelic_rpm'
end
