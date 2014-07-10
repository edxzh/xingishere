# encoding: utf-8
#
# 测死链脚本    ruby 1.9.3
#
# gem版本：typhoeus (0.6.1) mechanize (2.5.1)
#
# 用法：
#     ruby script/deadlink.rb
#
# 原理说明：
#     用 mechanize 抓TO_GET_LINK里的页面，找到上面所有链接
#     再用 typhoeus 并发请求这些链接，对失败的请求再用 typhoeus 分别发送请求
#     typhoeus 最终调用的是curl。
#     如遇到couldn't_connect couldn't_resolve_host情况，建议调小并发量。
#
# Mechanize log: log/mechanize.log
# deadlink log: tmp/2014-07-10-111111_broken_link.csv

require 'csv'
require 'net/http'
require 'mechanize'
require 'typhoeus'

ALLOW_STATUS = [200, 301, 302, 303]

outfile_path = File.expand_path("../../tmp/#{Time.now.strftime("%Y-%m-%d")}_broken_link.csv", __FILE__)
outfile = CSV.open(outfile_path, 'w')

def valid_link?(href)
  href.to_s != "javascript:void(0)" && href.to_s != "#" && href.to_s != "" && href.to_s.include?('http')
end

class String
  def to_link
    if self[0] == '/'
      "http://www.xingishere.com#{self}"
    else
      self
    end
  end
end

class NilClass
  def to_link
    ""
  end
end

TO_TEST_LINK = {
  :index      =>  "http://www.xingishere.com",
  :blogs      =>  "http://www.xingishere.com/blogs",
  :links      =>  "http://www.xingishere.com/links",
}

@options                    = {}
@request_hash               = {}
@broken_responses_hash      = {}
@final_errors               = {}

# max_concurrency并发数，默认200
# hydra = Typhoeus::Hydra.new

hydra = Typhoeus::Hydra.new(max_concurrency: 100)

Typhoeus.on_success do |response|
  p "SUCCESS #{response.code} : #{response.effective_url}"
end

Typhoeus.on_failure do |response|
  p "ERROR #{response.code} : #{effective_url}"
end

p Time.now
