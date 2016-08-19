# Docker Alpine Ruby

The smallest Docker image with Alphine 3.4 and Ruby 2.3.

## Native extensions

Uncomment the following lines from `Dockerfile` if you use these gems with native extensions:

* `puma`

      ENV RUBY_DEPENDENT_PACKAGES="make gcc libc-dev ${RUBY_DEPENDENT_PACKAGES}"

* `oj`

      ENV RUBY_DEPENDENT_PACKAGES="make gcc libc-dev ${RUBY_DEPENDENT_PACKAGES}"

* `nokogiri`

      ENV RUBY_DEPENDENT_PACKAGES="make libxml2 libxslt-dev g++ ${RUBY_DEPENDENT_PACKAGES}"
