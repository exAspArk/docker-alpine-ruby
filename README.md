# Docker Alpine Ruby

The smallest Docker image with Alphine 3.4 and Ruby 2.3. The image size is only 29 MB!

[Alpine Linux](http://alpinelinux.org/) is a Linux distribution built around `musl libc` and `BusyBox`.
The image is 5 MB in size and has access to a [package repository](http://pkgs.alpinelinux.org/packages)
that is much more complete than other BusyBox based images.

## Usage

Install [Docker](https://docs.docker.com/engine/installation/).

To build an image from the `Dockerfile` run:

    $ make build
    $ docker images

    REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
    docker-alpine-ruby   latest              1fa6b8033680        7 seconds ago       31.72 MB
    alpine               3.4                 4e38e38c8ce0        8 weeks ago         4.799 MB

Now you can test your image by running a command:

    $ make run COMMAND='echo hello world'

    hello world

Or you can connect in console:

    $ make connect

    # echo hello world
    hello world

To reduce the size of the image:

    $ make flatten

    REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
    docker-alpine-ruby   latest              aaad6c488c79        8 seconds ago       29.24 MB
    <none>               <none>              1fa6b8033680        3 minutes ago       31.93 MB
    alpine               3.4                 4e38e38c8ce0        8 weeks ago         4.799 MB

Remove containers and images:

    $ docker ps -a

    CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
    c20ce0f07d47        1fa6b8033680        "/bin/sh"           2 minutes ago       Created                                 docker-alpine-ruby

    $ make remove_containers
    $ make remove_images

## Native extensions

Uncomment the following lines from the [Dockerfile](https://github.com/exAspArk/docker-alpine-ruby/blob/master/Dockerfile) if you use these gems with native extensions:

* puma

```
ENV RUBY_DEPENDENT_PACKAGES="make gcc libc-dev ${RUBY_DEPENDENT_PACKAGES}"
```

* oj

```
ENV RUBY_DEPENDENT_PACKAGES="make gcc libc-dev ${RUBY_DEPENDENT_PACKAGES}"
```

* nokogiri

```
ENV RUBY_DEPENDENT_PACKAGES="make libxml2 libxslt-dev g++ ${RUBY_DEPENDENT_PACKAGES}"
```

## Useful links

* [Reduce docker image size](http://dev.im-bot.com/docker-reduce-image-size/).
* [Difference between save and export in Docker](http://tuhrig.de/difference-between-save-and-export-in-docker/).
* [A faster bundle install](https://coderwall.com/p/u1xpag/a-faster-bundle-install).
* [How to cache bundle install with Docker](https://medium.com/@fbzga/how-to-cache-bundle-install-with-docker-7bed453a5800#.hs1xjro2l).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/exAspArk/docker-alpine-ruby.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
