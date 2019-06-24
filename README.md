# Chat System API (V1)

## Table of Contents

- [Codebase](#codebase)
  - [The stack](#the-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Docker Installation](#docker-installation)

## Codebase

### The stack

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://rubyonrails.org/)
- [Mysql](https://www.mysql.com/downloads/)
- [Elasticsearch](https://www.elastic.co/)
- [Nodejs](https://nodejs.org/en/)
- [redis](https://redis.io/)
- [Sidekiq](https://sidekiq.org/)

## Getting Started

This section provides a high-level requirement & quick start guide for installing the application using Docker.

### Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

### Docker Installation

1. Install `docker` and `docker-compose`
1. `git clone git@github.com:ahmadabdelhalim/chat-system-api.git`
1. `cd chat-system-api`
1. run `docker-compose up`
1. run spec `docker-compose exec web rspec`
1. That's it! Navigate to `http://localhost:3000/rails/info/routes` to find all the routes.


