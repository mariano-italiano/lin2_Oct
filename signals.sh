#!/bin/bash
# Przechwytywanie sygnałów

LOGFILE=/tmp/skrypt.signals
INT=0

function przechwyc_sigint {
	INT=$(( INT + 1))
	echo
	if [[ $INT > 0 ]]; then 
		echo "Wystapił sygnał SIGINT(2) po raz $INT" >> $LOGFILE
	fi

	if [[ $INT == 3 ]]; then
		exit 0
	fi
}

trap przechwyc_sigint SIGINT

while true
do
	echo "Śpimy 10s..."
	sleep 10
done
