FROM alpine:3.4

MAINTAINER exAspArk <exAspArk@gmail.com>

# update packages
RUN apk update && apk upgrade

# install ruby packages
RUN apk --no-cache add ruby ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal

# gem 'oj', 'puma', 'byebug'
# RUN apk --no-cache add make gcc libc-dev

# gem 'nokogiri'
# RUN apk --no-cache add make libxml2 libxslt-dev g++

# gem 'rb-readline'
# RUN apk --no-cache add ncurses

# gem 'unf_ext'
# RUN apk --no-cache add g++

# app dependencies
# RUN apk --no-cache add ca-certificates

# clear after installation
RUN rm -rf /var/cache/apk/*

# to avoid installing documentation for gems
# COPY gemrc ~/.gemrc

# create APP_HOME
# ENV APP_HOME /srv/app
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME

# bundle install
# COPY Gemfile* $APP_HOME/
# RUN bundle install

# copy project
# COPY . $APP_HOME
