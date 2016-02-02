FROM zhouxing/starzhou:0.2
MAINTAINER zhouxing <Edward_mjz@hotmail.com>

RUN apt-get update -y

RUN apt-get install -y libpq-dev nodejs default-jre git

WORKDIR /app

ENV DOCKER=true

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

ADD . /app

EXPOSE 80
