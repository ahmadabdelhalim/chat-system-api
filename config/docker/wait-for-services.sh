#! /bin/sh

# Wait for MySQL
until nc -z -v -w30 $DB_HOST $DB_PORT; do
 echo 'Waiting for MySQL...'
 sleep 3
done
echo "MySQL is up and running!"

# wait for elasticsearch
until nc -vz $ELASTICSEARCH_HOST 9200; do
  echo "Elasticsearch is not ready, sleeping..."
  sleep 3
done
echo "Elasticsearch is ready, starting Rails."
