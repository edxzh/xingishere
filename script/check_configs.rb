#!/usr/bin/env ruby
# encoding: utf-8
# 通过调用rake脚本，检查当前配置

rails_root = File.expand_path("../../", __FILE__)
rails_env = ARGV[0] || 'production'

command = "cd #{rails_root}; bundle exec rake checker:check_configs RAILS_ENV=#{rails_env}"
puts "执行 #{command}"
puts
system command
