#!/bin/bash
while true
do
	echo `date`" Starting rollover"
	curl -k --cacert ./ca.crt --cert ./elasticrollover.pem --key ./elasticrollover.key -X POST "$ELASTIC_HOST:$ELASTIC_PORT/$INDEX_NAME/_rollover" -H 'Content-Type: application/json' -d'{"conditions": {"max_age": "${MAX_AGE_ROLLOVER}","max_docs":${MAX_DOCS_ROLLOVER},"max_size": "${MAX_SIZE_ROLLOVER}"}}'
	echo -e '\n'
	echo `date`" Rollover executed"
    sleep $ROLLOVERSCRIPT_TIME
done