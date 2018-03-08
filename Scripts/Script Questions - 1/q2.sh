#!/bin/bash
# Accept three numbers as command line arguments and print the largest
A="$1"
B="$2"
C="$3"
if [[ "$A" -ge "$B" ]] && [[ "$A" -ge "$C" ]];
then
	LARGE="$A"
elif [[ "$B" -ge "$A" ]]&&[[ "$B" -ge "$C" ]];
then
	LARGE="$B"
else
	LARGE="$C"
fi
echo "$LARGE"
