# -*- encoding : utf-8 -*-
worker_processes 3
timeout 30
listen File.expand_path('/tmp/My_blog.sock'), backlog: 64
preload_app true

pid File.expand_path('../../tmp/pids/unicorn.pid', __FILE__)

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('../../Gemfile', __FILE__)
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill('QUIT', File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
