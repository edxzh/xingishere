# xingishere [![Build Status](https://travis-ci.org/Dogzhou/xingishere.svg)](https://travis-ci.org/Dogzhou/xingishere) [![Build Status](https://snap-ci.com/Dogzhou/xingishere/branch/master/build_image)](https://snap-ci.com/Dogzhou/xingishere/branch/master)
My open source blog project

# description
It's my blog called xingishere, The author come from sichuan, chengdu, china.

It was supposed to be done a few months ago, but I spent a lot of time on DOTA, basketball and so on.

It is coded by ruby 1.9.3 and running on rails3.2.13. 

The code maybe not elegant, so if u have some advice, contact me please, I would be grateful to u

The online blog is <a href="http://starzhou.com" target="_blank">starzhou.com.</a> I have wrote some tech blog on it.
## environment
* ruby 1.9.3
* rails 3.2.13
* mysql 5.5

## usage
    bundle install
    ruby script/configs_init.rb

## script
After deployed, you should execute checker script to make sure the configuration is intack

    ruby script/check_configs.rb

then execute deadlink script to make sure there is no 404 or 500 error on all links

    ruby script/deadlink.rb

## Acknowledgement
<p>Thanks <a href="https://github.com/zhangyuan" target="_blank">zhangyuan</a> <a href="https://github.com/huhongda" target="_blank">huhongda</a> <a href="http://sosop.github.io/" target="_blank">houxiaolong</a>, who give me a lot support and confidence.</p>
