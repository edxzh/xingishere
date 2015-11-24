xingishere
======

[![Build Status](https://travis-ci.org/Dogzhou/xingishere.svg)](https://travis-ci.org/Dogzhou/xingishere)
[![Build Status](https://snap-ci.com/Dogzhou/xingishere/branch/master/build_image)](https://snap-ci.com/Dogzhou/xingishere/branch/master)
[![Code Climate](https://codeclimate.com/github/Dogzhou/xingishere/badges/gpa.svg)](https://codeclimate.com/github/Dogzhou/xingishere)

My open source blog project

# description
It's my blog called xingishere, The author come from sichuan, chengdu, china.

It was supposed to be done a few months ago, but I spent a lot of time on DOTA, basketball and so on.

The code maybe not elegant, so if u have some advice, contact me please, I would be grateful to u

The online blog is <a href="http://starzhou.com" target="_blank">starzhou.com.</a> I have wrote some tech blog on it.

## environment
* ruby 2.2.3
* rails 4.2.1
* mysql 5.5
* memcached 1.4.24

## development
Clone this repo to local

    git clone https://github.com/Dogzhou/xingishere.git

Install dependency

    cd xingishere
    bundle install

Generate config files

    ruby script/configs_init.rb

Create database and database tables

    bundle exec rake db:create
    bundle exec rake db:migrate

Generate admin account, email is `admin@admin.com`, password is `123456`

    bundle exec rake admin:generate

Custom config/settings.yml, the file in repo can be an example

## script
After deployed, you should execute checker script to make sure the configuration is intack

    ruby script/check_configs.rb

then execute deadlink script to make sure there is no 404 or 500 error on all links

    ruby script/deadlink.rb

## Contributing workflow

Here’s how we suggest you go about proposing a change to this project:

1. [Fork this project](https://help.github.com/articles/fork-a-repo/) to your account.
2. [Create a branch](https://help.github.com/articles/creating-and-deleting-branches-within-your-repository/) for the change you intend to make.
3. Make your changes to your fork.
4. [Send a pull request](https://help.github.com/articles/using-pull-requests/) from your fork’s branch to `master` branch

Using the web-based interface to make changes is fine too, and will help you by automatically forking the project and prompting to send a pull request too.

## Acknowledgement
<p>Thanks <a href="https://github.com/zhangyuan" target="_blank">zhangyuan</a> <a href="https://github.com/huhongda" target="_blank">huhongda</a> <a href="http://sosop.github.io/" target="_blank">houxiaolong</a>, who give me a lot support and confidence.</p>
