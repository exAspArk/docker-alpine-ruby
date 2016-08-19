FROM alpine:3.4

MAINTAINER exAspArk <exAspArk@gmail.com>

# update packages
RUN apk update && apk upgrade

# install ruby packages
RUN apk --no-cache add ruby ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal

# gem 'oj', 'puma'
# RUN apk --no-cache add make gcc libc-dev

# gem 'nokogiri'
# RUN apk --no-cache add make libxml2 libxslt-dev g++

# clear after installation
RUN rm -rf /var/cache/apk/*

# to avoid installing documentation for gems
COPY gemrc ~/.gemrc
