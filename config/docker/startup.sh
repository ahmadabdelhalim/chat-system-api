#! /bin/sh

echo -e "\n\e[1m\e[44m Wait for services to run..... \e[0m\n"
sh ./config/docker/wait-for-services.sh

echo -e "\n\e[1m\e[44m Installing gems..... \e[0m\n"
bundle install

echo -e "\n\e[1m\e[44m Trying to migrate database..... \e[0m\n"
bin/rake db:migrate 2>/dev/null
if [ "$?" != "0" ]; then
  echo -e "\n\e[1m\e[44m Migration failed, creating database first..... \e[0m\n"
  bin/rake db:create db:schema:load db:seed db:migrate
fi

echo -e "\n\e[1m\e[44m Running container's command..... \e[0m\n"
rm -f tmp/pids/server.pid

echo -e "\n\e[1m\e[44m Reindex the models..... \e[0m\n"
rake searchkick:reindex:all

echo -e "\n\e[1m\e[44m Start Rails server..... \e[0m\n"
bundle exec rails server -p 3000 -b 0.0.0.0