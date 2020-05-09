#!/bin/bash

if [ $USER != 'root' ]
then
	echo 'You should use sudo to run tests'
	exit 1
fi

CONF=./conf
FILE_FOR_TEST=test_file.txt
RIGHT_PERMISSIONS=644
DELAY=60 #sec

touch $FILE_FOR_TEST

echo "$FILE_FOR_TEST:$RIGHT_PERMISSIONS:root:root" >> $CONF

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
./control_service.sh &
CONTROL_SERVICE_PID=$!
sleep 2
changedPermissions=$(stat -c %a $FILE_FOR_TEST)
compareParameters "Basic test" $changedPermissions $RIGHT_PERMISSIONS

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

echo "If you see OK for 3 times then all work well"

rm $FILE_FOR_TEST

# delete last line from CONF
# containing info about FILE_FOR_TEST
sed -i '$ d' $CONF 