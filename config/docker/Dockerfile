FROM node:10.13.0-slim as nodejs

# ******Multi stage ********
FROM ruby:2.6

# Install common dev libs
RUN apt-get update -qq && apt-get install -y \
  build-essential vim git netcat

# Install Nodejs 10.13.0
ENV NODE_VERSION=10.13.0

WORKDIR /app

# Invalidate gems cache if change Gemfile or Gemfile.lock
COPY Gemfile Gemfile.lock /app/
RUN gem install bundler && bundle install -j 4

COPY . .