#!/bin/bash

until cd /opt/deploy/intel_owl
do
    echo "Waiting for server volume..."
done

# Apply database migrations
echo "Waiting for db and UWSGI to be ready..."
sleep 5

/usr/local/bin/celery -A intel_owl.celery worker -n worker_long --uid root --gid root --time-limit=40000 --pidfile= -Ofair -Q long -E
