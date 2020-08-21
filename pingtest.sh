#!/usr/local/bin/bash

echo -n "Eneter the name of your output file [ENTER]: "
        read LOG_OUT
echo -n "Enter the file name with your domains in [ENTER]: "
         read SOURCE_FILE

echo "Connectivity Test Results" > $LOG_OUT
date > $LOG_OUT
for host in $(cat $SOURCE_FILE ); do 
	fping -u $host >& /dev/null
    if [ $? -eq 0 ]; then
        echo "$host is Alive"  > $LOG_OUT
    else 
    	echo "$host is DOWN" > $LOG_OUT

    fi
done

