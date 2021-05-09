FROM ruby:2.7.3

# Add repositories
# NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

# Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


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
        nodejs \
        yarn \
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
