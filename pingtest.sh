
#!/usr/local/bin/bash
 
echo -n "Eneter the name of your output file [ENTER]: "
        read LOG_OUT
echo -n "Enter the file name with your domains in [ENTER]: "
         read SOURCE_FILE

echo "Connectivity Test Results" >> $LOG_OUT
date >> $LOG_OUT



for host in $(cat $SOURCE_FILE ); do 
    status_code=$(curl -m 2.5 -s --write-out '%{http_code}\n' "$host" -o /dev/null ) > /dev/null
    if  [[ $status_code == *"200"* ]]; then
        echo -e  "$host is Alive"  >> $LOG_OUT
    elif [[ $status_code == *"301"* ]]; then
    	 echo -e "$host is Permanently Redirected" >> $LOG_OUT
   	elif [[ $status_code == *"302"* ]]; then
    	 echo -e "$host is Temporarily Redirected" >> $LOG_OUT
    else  
        echo -e "$host is Down" >> $LOG_OUT

    fi
done

