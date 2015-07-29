FROM docker-registry.delivery.realestate.com.au/shinkansen/ubuntu-ruby2.1:201504232114
MAINTAINER Mike Bailey <mike.bailey@rea-group.com>, Adam Tohovitis <adam.tohovitis@rea-rea-group.com>

RUN apt-get update -y

RUN apt-get install -y git

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs 8

ADD . /app

EXPOSE 80

CMD ["bin/run"]
