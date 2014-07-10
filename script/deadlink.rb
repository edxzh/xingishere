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
