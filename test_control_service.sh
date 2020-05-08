#!/bin/bash

CONF=./conf
FILE_FOR_TEST=test_file.txt
RIGHT_PERMISSIONS=644

touch $FILE_FOR_TEST

echo "$FILE_FOR_TEST:$RIGHT_PERMISSIONS:root:root" >> $CONF

function compareParameters {
	echo $1
	if [[ $2 == $3 ]]
	then 
		echo "Test OK"
	else 
		echo "Test Error"
		echo "Got $2, when expect $3"
	fi
}

# first test
chmod 744 $FILE_FOR_TEST 
./control_service.sh &
CONTROL_SERVICE_PID=$!
sleep 2
changedPermissions=$(stat -c %a $FILE_FOR_TEST)
compareParameters "first test" $changedPermissions $RIGHT_PERMISSIONS

rm $FILE_FOR_TEST

# delete last line from CONF
# containing info about FILE_FOR_TEST
sed -i '$ d' $CONF 
