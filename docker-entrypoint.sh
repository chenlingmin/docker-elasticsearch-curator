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
            \"unit_count\":$DELETE_THAN_IN_DAYS
          },{
            \"filtertype\":\"pattern\",
            \"kind\":\"prefix\",
            \"value\":\"$INDEX_PREFIX-\"
          }]"
    curator_cli \
        --host $ELASTICSEARCH_HOST \
        close --ignore_empty_list \
        --filter_list "[{
            \"filtertype\":\"age\",
            \"source\":\"creation_date\",
            \"direction\":\"older\",
            \"timestring\":\"%Y.%m.%d\",
            \"unit\":\"days\",
            \"unit_count\":$CLOSE_THAN_IN_DAYS
          },{
            \"filtertype\":\"pattern\",
            \"kind\":\"prefix\",
            \"value\":\"$INDEX_PREFIX-\"
          }]"
    sleep ${INTERVAL_IN_HOURS}h
done
