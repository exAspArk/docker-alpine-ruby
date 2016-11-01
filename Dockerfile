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

# gem 'ffi'
# RUN apk --no-cache add libffi-dev

# app dependencies
# RUN apk --no-cache add ca-certificates

# clear after installation
RUN rm -rf /var/cache/apk/*

# to avoid installing documentation for gems
# ENV HOME /home/root
# RUN mkdir $HOME
# COPY gemrc $HOME/.gemrc

# use mounted volume for gems
# ENV BUNDLE_PATH /bundle

# create APP_HOME
# ENV APP_HOME /srv/app
# RUN mkdir $APP_HOME
# WORKDIR $APP_HOME
