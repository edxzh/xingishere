# encoding: utf-8

require 'net/http'

namespace :checker do
  desc  "检查项目配置"
  task  :check_configs => :environment do

    def check(title, error="", &block)
      puts title.colorize(:green)
      puts ""

      begin
        start = Time.now
        block.call
        elapsed = Time.now - start
        print "耗时#{elapsed} S [ok]".green
      rescue => e
        print "[失败]".red
        puts " "
        puts error.red
      end
    end

    check "检查数据库配置", "请检查数据库配置" do
      User.last
    end
  end
end
