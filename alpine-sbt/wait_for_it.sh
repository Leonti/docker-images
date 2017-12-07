#!/usr/bin/env bash

# - WAIT_EXPRESSION=[ $$(curl --write-out %{http_code} --silent --output /dev/null http://app:9000/config) = 200 ]
# - WAIT_SLEEP=2
# - WAIT_LOOPS=60

wait_check=${WAIT_EXPRESSION:-"true"}

echo "wait check: $wait_check"

is_ready() {
    eval $wait_check
}

# wait until is ready
i=0
while ! is_ready; do
    i=`expr $i + 1`
    if [ $i -ge $WAIT_LOOPS ]; then
        echo "$(date) - still not ready, giving up"
        exit 1
    fi
    echo "$(date) - waiting to be ready"
    sleep $WAIT_SLEEP
done

echo "$(date) - ready!"

#start the script
exec "$@"
