FROM ruby:2.6

RUN apt-get update -qq && \
        apt-get install --no-install-recommends -y \
                build-essential \
                mysql-client \
                nodejs \
                libxml2-dev \
                libxslt1-dev \
                netcat vim git \
                cron && \
        apt-get autoclean

# Install Nodejs 10.13.0
ENV NODE_VERSION=10.13.0

WORKDIR /app

# Invalidate gems cache if change Gemfile or Gemfile.lock
COPY Gemfile Gemfile.lock /app/
RUN gem install bundler && bundle install -j 4

COPY . .