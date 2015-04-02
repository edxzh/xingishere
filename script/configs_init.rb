# encoding: utf-8
# initialize config files
require 'colorize'

def init_database_config
  puts 'create database.yml...'.green
  puts system 'cp config/database.yml.example config/database.yml'
end

def init_mongoid_config
  puts 'create mongoid.yml...'.green
  `cp config/mongoid.yml.example config/mongoid.yml`
  puts 'mongoid.yml is successful created'.yellow
end

def init_memcached_config
  puts 'create memcached.yml...'
  `cp config/memcached.yml.example config/memcached.yml`
  puts 'memcached.yml is successful created'.yellow
end

def init_settings_config
  puts 'create settings.yml and settings/development.yml'.green
  `cp config/settings.yml.example config/settings.yml`
  `cp config/settings/development.yml.example config/settings/development.yml`
  puts 'done....'.yellow
end

def init_unicorn_config
  puts 'create unicorn settings'.green
  `cp config/unicorn.rb.example config/unicorn.rb`
  `cp config/unicorn_init.example config/unicorn_init`
  puts 'done.....'.yellow
end

init_database_config
init_mongoid_config
init_memcached_config
init_settings_config
init_unicorn_config
