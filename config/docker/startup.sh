#! /bin/sh

# Wait for DB services
sh ./config/docker/wait-for-services.sh

# Prepare DB (Migrate - If not? Create db & Migrate)
sh ./config/docker/prepare-db.sh

bundle check || bundle install
rm -f tmp/pids/server.pid

bundle exec rails server -p 3000 -b 0.0.0.0