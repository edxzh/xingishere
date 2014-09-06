# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
 set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever


job_type :rake_without_flock, "cd :path;PATH=#{ENV['PATH']} bundle exec rake :task RAILS_ENV=production"

# 注意，rake 必须执行 flock 文件名
job_type :rake, "mkdir -p /tmp/zhe800_crontab_lock; chmod +xrw /tmp/blog_crontab_lock ; flock -xn /tmp/blog_crontab_lock/:flock.lock -c 'cd :path;PATH=#{ENV['PATH']} bundle exec rake :task RAILS_ENV=production'"

every '30 21 * * 0' do
  rake "regular_job:send_week_chosen", flock: "regular_job.send_week_chosen"
end
