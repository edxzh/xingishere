<p>It's my blog called xing's blog, author come from sichuan, chengdu, china.</p>
<p>It was supposed to be done a few months ago, but I spent a lot of time on DOTA, basketball, and sex</p>
<p>It is coded by ruby 1.9.3 and running on rails3.2.13. </p>
<p>want to build your own rails blog? like my UI design? you can do this</p>
<pre>
<code>
# down load the source code
git clone https://github.com/Dogzhou/My_blog.git
# generate your own config files
cd My_blog
ruby script/generate_configs.rb
# edit your config files
vim config/database.yml
vim config/mongoid.yml
vim config/unicorn.rb
vim config/unicorn_init.rb
# check whether your config is right
ruby script/check_configs
# install gems
bundle install
# generate database tables
bundle exec rake db:migrate
# 
</code>
</pre>
<p>The code maybe not elegant, so if u have some advice, contact me please, I would be grateful to u.</p>
<p>The online blog is <a href="http://www.xingishere.com">www.xingishere.com.</a>I have wrote some tech blog on it</p>
<p>Thanks zhangyuan/huhongda/houxiaolong, who give me a lot support and confidence.</p>
<p>I love my blog, I will develop more.</p>
