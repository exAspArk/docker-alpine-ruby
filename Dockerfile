FROM alpine:3.4

MAINTAINER exAspArk <exAspArk@gmail.com>

ENV RUBY_PACKAGES ruby ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal
ENV RUBY_DEPENDENT_PACKAGES ''

# update packages
RUN apk update && apk upgrade

# install new packages
RUN apk --no-cache add $RUBY_PACKAGES

# gem 'oj', 'puma'
# ENV RUBY_DEPENDENT_PACKAGES="make gcc libc-dev ${RUBY_DEPENDENT_PACKAGES}"

# gem 'nokogiri'
# ENV RUBY_DEPENDENT_PACKAGES="make libxml2 libxslt-dev g++ ${RUBY_DEPENDENT_PACKAGES}"

# install dependencies for gems with native extensions
RUN apk --no-cache add $RUBY_DEPENDENT_PACKAGES

# clear after installation
RUN apk del ruby-dev
RUN rm -rf /var/cache/apk/*

# to avoid installing documentation for gems
COPY gemrc ~/.gemrc
