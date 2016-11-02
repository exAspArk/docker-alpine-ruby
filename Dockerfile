FROM alpine:3.4

MAINTAINER exAspArk <exAspArk@gmail.com>

RUN \
  # update packages
  apk update && apk upgrade && \

  # install ruby
  apk --no-cache add ruby ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal && \

  # gem 'oj', 'puma', 'byebug'
  # apk --no-cache add make gcc libc-dev && \

  # gem 'nokogiri'
  # bundle config --global build.nokogiri --use-system-libraries && \
  # apk --no-cache add make libxml2 libxslt-dev g++ && \

  # gem 'rb-readline'
  # apk --no-cache add ncurses && \

  # gem 'ffi'
  # apk --no-cache add libffi-dev && \

  # gem 'mysql2'
  # apk --no-cache add mysql-dev && \

  # gem 'unf_ext'
  # apk --no-cache add g++ && \

  # gem 'tiny_tds'
  # apk --no-cache add freetds-dev && \

  # app dependencies
  # apk --no-cache add ca-certificates git && \

  # clear after installation
  rm -rf /var/cache/apk/*

# to avoid installing documentation for gems
COPY gemrc $HOME/.gemrc

# use mounted volume for gems
ENV BUNDLE_PATH /bundle

# create WORKDIR
ENV WORKDIR /srv/current
RUN mkdir $WORKDIR
WORKDIR $WORKDIR
