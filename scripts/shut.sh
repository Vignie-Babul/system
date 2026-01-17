#!/bin/bash

# enter a system sleep state, automatically
# wake the system after WAKE_TIME_MIN and
# shutdown after SLEEP_TIME_SEC


WAKE_TIME_MIN=120
SLEEP_TIME_SEC=20


if sudo rtcwake --date=+${WAKE_TIME_MIN}min --mode=mem; then
	printf "\nSystem shutdown in %s sec\n" "$SLEEP_TIME_SEC"
	sleep $SLEEP_TIME_SEC
	shutdown -P now
	exit 0
else
	echo "rtcwake failed"
	exit 1
fi
