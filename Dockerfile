FROM python:3.6.4-alpine3.7
RUN adduser -D curator

RUN pip install elasticsearch-curator==5.4.1
COPY docker-entrypoint.sh /

ENV INTERVAL_IN_HOURS=24
ENV DELETE_THAN_IN_DAYS=20
ENV CLOSE_THAN_IN_DAYS=7
ENV INDEX_PREFIX=logstash
ENV ELASTICSEARCH_HOST=elasticsearch

ENTRYPOINT ["/docker-entrypoint.sh"]
