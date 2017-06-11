#!/bin/bash
#set -e
#set -x
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' > /dev/null 2>&1 & 

echo -n "> Waiting for mysql to start"
until mysql -e ";" > /dev/null 2>&1
do
	echo -n "."
	sleep 1
done

/usr/bin/mysqladmin -uroot password 'rootpass'