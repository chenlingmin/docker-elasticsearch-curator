# docker-elasticsearch-curator

This only job executed by the docker built from this repository is to clean the elastic search logstash history leaving only a configurable amount of days worth of logging in the system. The job runs in the specified interval.

It can be run as follows:

	docker run -d -e INTERVAL_IN_HOURS=24 -e DELETE_THAN_IN_DAYS="20" -e CLOSE_THAN_IN_DAYS="10" --link es1:elasticsearch chenlmdocker/docker-elasticsearch-curator
	
where **es1** is the name of the elasticsearch container and

* **INTERVAL\_IN\_HOURS**: The amount of time between two curator runs
* **DELETE\_THAN\_IN\_DAYS**: Indicates all logs with a date exceeding this age can be deleted.
* **CLOSE\_THAN\_IN\_DAYS**: Indicates all logs with a date exceeding this age can be closed.

