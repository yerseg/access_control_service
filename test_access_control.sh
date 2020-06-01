#!/bin/bash

CONF=/etc/access_control.conf
FILE_FOR_TEST=~/test_file
DELAY=61 #sec

touch $FILE_FOR_TEST

RIGHT_PERMISSIONS=$(stat -c %a $FILE_FOR_TEST)
RIGHT_OWNER=$(stat -c %U $FILE_FOR_TEST)
RIGHT_GROUP=$(stat -c %G $FILE_FOR_TEST)

echo "$FILE_FOR_TEST:$RIGHT_PERMISSIONS:$RIGHT_OWNER:$RIGHT_GROUP" >> $CONF

function compareParameters {
	if [[ $2 == $3 ]]
	then 
		echo "[+] $1 - OK"
	else 
		echo "[-] $1 - Error"
		echo "Got $2, when expect $3"
	fi
}

chmod 777 $FILE_FOR_TEST 
CONTROL_SERVICE_PID=$(pgrep access_control)
sleep 2
changedPermissions=$(stat -c %a $FILE_FOR_TEST)
compareParameters "Basic test permissions" $changedPermissions $RIGHT_PERMISSIONS

chown $USER $FILE_FOR_TEST 
sleep 2
changedOwner=$(stat -c %U $FILE_FOR_TEST)
compareParameters "Basic test owner" $changedOwner $RIGHT_OWNER

chgrp $USER $FILE_FOR_TEST 
sleep 2
changedGrp=$(stat -c %G $FILE_FOR_TEST)
compareParameters "Basic test group" $changedGrp $RIGHT_GROUP

chmod 777 $FILE_FOR_TEST 
kill -USR1 $CONTROL_SERVICE_PID
sleep 2
changedPermissions=$(stat -c %a $FILE_FOR_TEST)
compareParameters "SIGUSR1 test" $changedPermissions $RIGHT_PERMISSIONS

chmod 777 $FILE_FOR_TEST
echo "Need to wait $DELAY sec"
sleep $DELAY
changedPermissions=$(stat -c %a $FILE_FOR_TEST)
compareParameters "Periodic work test" $changedPermissions $RIGHT_PERMISSIONS

echo "If you see OK for 5 times then all work well"

rm $FILE_FOR_TEST

# delete last line from CONF
# containing info about FILE_FOR_TEST
sed -i '$ d' $CONF 
