# encoding : utf-8

require 'bundler/capistrano'

default_run_options[:pty] = true

set :scm, :git

set :production_config_path, File.expand_path('../recipes/production.rb', __FILE__)

if File.exists?(production_config_path)
  require production_config_path[0..-4]
end

set :deploy_via, :remote_cache

# tell server where source code located, default is "/apps#{application}"
set :normalize_asset_timestamps, false
# ssh_options[:forward_agent] = true
set :user, fetch(:user, 'deployer')

set :use_sudo, false

set :application, "mywebsite"
set :branch, fetch(:branch, "master")
set :deploy_to, fetch(:deploy_to, "/var/www/sites/mywebsite")
set :repository,  "git@github.com:Dogzhou/My_blog.git"

# set :whenever_command, "bundle exec whenever"
after "deploy", "deploy:cleanup"

namespace :deploy do
  desc '创建部署任务，部署者机器上执行'
  task :setup_capistrano_configs do
    unless File.exist?(production_config_path)
      File.open(production_config_path, 'w') do |f|
        f.write <<-CONFIG
# encoding : utf-8
Capistrano::Configuration.instance.load do
  role :app, "128.199.228.130"                       # Web服务器，运行 Rails 项目的服务器
  role :db,  "128.199.228.130", :primary => true     # 执行Rake任务的服务器
  role :web, "128.199.228.130"
  set :branch, "master"                             # 分支
  set :deploy_to, "/var/www/sites/mywebsite"               # 部署目录
end
        CONFIG
      end
      puts "已经创建配置文件"
      puts "请修改 #{production_config_path}"
    else
      puts "配置文件已存在"
      puts "请修改 #{production_config_path}"
    end
  end

  task :restart, :roles => :app do
    run "cd #{deploy_to}/current/; touch tmp/restart.txt"
  end

  desc "在本地生成配置文件"
  task :setup_local_configs do
    system "cat config/database.yml.example > config/database.yml"
    system "cat config/settings/production.local.yml.example > config/settings/production.local.yml"

    puts "请修改如下配置，这些配置将同步到服务器"
    puts "config/database.yml"
    puts "config/settings/production.local.yml"
  end

  desc "在服务器创建配置文件"
  task :setup_configs, roles: :app do
    run "mkdir -p #{shared_path}/config"
    run "mkdir -p #{shared_path}/config/settings"

    put File.read("config/database.yml.example"), "#{shared_path}/config/database.yml"
    put File.read("config/settings/production.local.yml.example"), "#{shared_path}/config/settings/production.local.yml"

    puts "请修改如下配置"
    puts "#{shared_path}/config/database.yml"
    puts "#{shared_path}/config/settings/production.local.yml"
  end

  after "deploy:setup", "deploy:setup_configs"

  desc '创建配置的软链接'
  task :symlink_configs, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/settings/production.local.yml #{release_path}/config/settings/production.local.yml"
    run "ln -nfs #{shared_path}/public/uploads #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/config/newrelic.yml #{release_path}/config/newrelic.yml"
  end

  desc "Sync the public/assets directory."
  task :assets_sync do
    system('bundle exec rake assets:precompile')
    find_servers(:roles => :web).each do |s|
      system "rsync -vr --exclude='.DS_Store' public/assets #{user}@#{s}:#{release_path}/"
    end
  end

  desc 'precompile assets on the server'
  task :precompile_assets, :roles => :web do
    run "cd #{release_path}; RAILS_ENV=production bundle exec rake assets:precompile"
  end

  after "deploy:update_code", "deploy:symlink_configs", "deploy:precompile_assets", "deploy:migrate"

  # rvm Capistrano
  set :rvm_type, :user                     # Defaults to: :auto
  set :rvm_ruby_version, '1.9.3-p125'      # Defaults to: 'default'
  # set :rvm_custom_path, '~/.myveryownrvm'  # only needed if not detected
end
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
