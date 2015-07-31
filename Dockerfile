FROM zhouxing/starzhou:0.2
MAINTAINER zhouxing <Edward_mjz@hotmail.com>

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

EXPOSE 80
