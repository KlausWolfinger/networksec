#!/bin/bash
# kdw
# some vars
#
oid_1="iso.3.6.1.2.1.1.1.0" 

#
clear
echo "SNMP Bruter with traceroute"
echo "------------------------------"
echo "will test $oid_1"
echo "------------------------------"
echo "do NOT use without permission"
echo "------------------------------"
echo -en "Enter destination [89.22.175.204] :" 
read _destination
if [ -z "$_destination" ]; then
	_destination="89.22.175.204"
	fi
echo "Perform a single test to $_destination ? [Y|N] "
read YN

if [ "$YN" = "N" ]; then
	echo "OK. starting traceroute first to $_destination..."


	HOPIP=`traceroute -n $_destination | grep -v "*" | awk '{print $2 }' | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"`
	_hops=$(echo $HOPIP | wc -m)
	
	echo "created an array with $_hops hops ... cont with portscan"
	for ip in ${HOPIP[@]}; do
	#echo -e "\n\tScanning now $ip ....."
	_found=`nmap -Pn -T4  -oG - -sU -p 161 $ip | grep  "161/open/udp/" | awk '/open/{print $2}'`
	if [ -z "$_found" ]; then
	echo ".. $ip closed"
	else
	echo ".. open on $_found "
	snmpget -v 2c -c public $_found $oid_1
	fi
		
	done
	### don't forget last hop
	_found=`nmap -Pn -T4  -oG - -sU -p 161 $_destination | grep  "161/open/udp/" | awk '/open/{print $2}'`
	if [ -z "$_found" ]; then
	echo ".. $ip closed"
	else
	echo ".. open on $_found "
	snmpget -v 2c -c public $_found $oid_1
	fi	
	
else
_found=`nmap -Pn -T4  -oG - -sU -p 161 $_destination | grep  "161/open/udp/" | awk '/open/{print $2}'`
	if [ -z "$_found" ]; then
	echo ".. $ip closed"
	else
	echo ".. open on $_found "
	snmpget -v 2c -c public $_found $oid_1 
	fi
fi

echo "############## done ##########"
echo "try: snmpwalk -v 2c -c public $_found"

