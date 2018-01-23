#!/bin/sh

set -e

while true; do
    echo Running delete_indices
    curator_cli \
        --host $ELASTICSEARCH_HOST \
        delete_indices --ignore_empty_list \
        --filter_list "[{
            \"filtertype\":\"age\",
            \"source\":\"creation_date\",
            \"direction\":\"older\",
            \"timestring\":\"%Y.%m.%d\",
            \"unit\":\"days\",
            \"unit_count\":$OLDER_THAN_IN_DAYS
          },{
            \"filtertype\":\"pattern\",
            \"kind\":\"prefix\",
            \"value\":\"logstash-\"
          }]"
    sleep ${INTERVAL_IN_HOURS}h
done
