#!/bin/bash
#Author SangNV

RANGEIP=$1
PORT=$2

CURTIME=`date +"%Y-%m-%d %H:%M:%S"`

ping()
{
    export IFS=","
    for ip in $RANGEIP; do
         nmap -sP ${ip} | grep "Nmap done" | grep "1 host up" > /dev/null
         STATUS=$?

         if [ ${STATUS} == 0 ]; then
             echo "${CURTIME} : host ${ip} up"
         else
             python sentmail.py null "${CURTIME} : host ${ip} down" "${CURTIME} : host ${ip} down"
         fi

    done
}

telnet()
{
    export IFS=","
    for ip in $RANGEIP; do
         nmap -PN -p ${PORT} --open -oG - ${ip} | wc -l  > /dev/null
         STATUS=$?

         if [ ${STATUS} == 0 ]; then
             python sentmail.py null "${CURTIME} : host ${ip} - port ${PORT} close" "${CURTIME} : host ${ip} - port ${PORT} $
         else
             echo "${CURTIME} : host ${ip} - port ${PORT} open"
         fi
   done
}

telnet()
{
    export IFS=","
    for ip in $RANGEIP; do
         nmap -PN -p ${PORT} --open -oG - ${ip} | wc -l  > /dev/null
         STATUS=$?

         if [ ${STATUS} == 0 ]; then
             python sentmail.py null "${CURTIME} : host ${ip} - port ${PORT} close" "${CURTIME} : host ${ip} - port ${PORT} $
         else
             echo "${CURTIME} : host ${ip} - port ${PORT} open"
         fi

    done
}

main()
{

    if [[ ${PORT} == "" ]]; then
        ping #call function ping()
    else
        ping
	telnet
    fi
}

main
