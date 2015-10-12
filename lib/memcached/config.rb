# encoding: utf-8
require 'dalli'

module Memcached
  module Config
    def self.servers
      unless @servers
        path   = File.join(Rails.root, 'config', 'memcached.yml')
        raise "Miss configuration memcached.yml, Please check" unless File.exist?(path)
        config = YAML.load_file(path)
        if config[Rails.env].blank? || config[Rails.env]['servers'].blank?
          raise "The format of memcached.yml is incorrect,please check"
        end
        servers = config[Rails.env]['servers']
        servers = [servers] unless servers.is_a? Array
        @servers = servers
      end
      @servers
    end
  end
end
