#!/bin/bash

while getopts "o:" flaga
do
	case "${flaga}" in 
		o) OPERATION=${OPTARG};;
	esac
done


if [ -z "$OPERATION" ] ; then
	echo 
	echo "Użycie skryptu: $0 {start|stop|status}"
	echo 
fi

if [ "$OPERATION" = "start" ] ; then
	/usr/bin/skrypt.sh &
	echo $! > /var/run/skrypt.pid
	echo "Skrypt $0 wystartowany"
elif [ "$OPERATION" = "stop" ] ; then
	kill `cat /var/run/skrypt.pid`
	rm /var/run/skrypt.pid
	echo "Skrypt $0 zatrzymany"
elif [ "$OPERATION" = "status" ] ; then
	if [ -e /var/run/skrypt.pid ] ; then
		echo Skrypt jest uruchomiony, pid=`cat /var/run/skrypt.pid`
	else 
		echo "Skrypt $0 nie działa"
		exit 1
	fi
fi

while true
do
	echo `date` >> /tmp/my-service.log
	sleep 10
done

