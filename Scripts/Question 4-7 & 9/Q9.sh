#!/bin/bash
if [ $# -ne 1 ];
then
	echo "Invalid number of arguments";
	exit 0;
fi
while [ true ];
do
	USAGE=$(ps -eo pid -o pcpu -o command --no-headers | sort -nrk 2 | head -n 1 | cut -d "." -f1 |  awk '{print $2}' )
	if [ $USAGE -gt $1 ]
	then
		MOSTUSAGE=$(ps -eo pid -o pcpu -o command --no-headers | sort -nrk 2 | head -n 1 | awk '{print $1}' )
		kill -9 $MOSTUSAGE
		echo "CPU Usage exceeded, killed most resource heavy process with PID : $MOSTUSAGE"
	else 
		exit 0
	fi
done
