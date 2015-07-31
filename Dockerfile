FROM zhouxing/starzhou:0.1
MAINTAINER zhouxing <Edward_mjz@hotmail.com>

RUN apt-get update -y

RUN apt-get install -y git

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs 8

ADD . /app

EXPOSE 80

CMD ["bin/run"]
