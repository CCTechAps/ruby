FROM starefossen/ruby-node:2-8-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        ca-certificates \
        bzip2 \
        libfontconfig \
        libpq-dev \
        imagemagick \
        libmagickwand-dev \
        git \
        build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

 RUN apt-get install -y --no-install-recommends \
         curl \
  && mkdir /tmp/phantomjs \
  && curl -L https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
         | tar -xj --strip-components=1 -C /tmp/phantomjs \
  && mv /tmp/phantomjs/bin/phantomjs /usr/local/bin \
     # Clean up
  && apt-get purge --auto-remove -y \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/*

