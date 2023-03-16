#!/bin/bash

function checkipv4conn() {
  CURRENT_IPV4=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)

  if [ -z "$1" ] || ([ "$1" != "ESTABLISHED" ] && [ "$1" != "LISTEN" ])
  then
    echo "Error: Missing argument [connection-status] Please, pass a valid connection status: checkipv4conn [ESTABLISHED|LISTENING]"
    return
  fi

  if [ "$1" = "ESTABLISHED" ]
  then
    netstat -an | grep "$1" | awk 'BEGIN { FS="('$CURRENT_IPV4'\.)" } /'$CURRENT_IPV4'/ { print $2 }' | awk -F'[ ]' '{ print ":"$1 }' | xargs -L1 lsof -i | awk '($1 !~ /COMMAND/ && $5 !~ /IPv6/) { print $0 }'
  elif [ "$1" = "LISTEN" ]
  then
    netstat -an | grep "$1" | awk 'BEGIN { FS="." } /./ { print $2 }' | awk -F'[ ]' '{ print ":"$1 }' | xargs -L1 lsof -i | awk '($1 !~ /COMMAND/ && $5 !~ /IPv6/) { print $0 }'
  fi
}

# function checkipv6conn() {
#   CURRENT_IPV4=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)

#   if [ -z "$1" ] || ([ "$1" != "ESTABLISHED" ] && [ "$1" != "LISTEN" ])
#   then
#     echo "Error: Missing argument [connection-status] Please, pass a valid connection status: checkports [ESTABLISHED|LISTENING]"
#     return
#   fi

#   if [ "$1" = "ESTABLISHED" ]
#   then
#     netstat -an | grep "$1" | awk 'BEGIN { FS="('$CURRENT_IPV4'\.)" } /'$CURRENT_IPV4'/ { print $2 }' | awk -F'[ ]' '{ print ":"$1 }' | xargs -L1 lsof -i | awk '($1 !~ /COMMAND/ && $5 !~ /IPv6/) { print $0 }'
#   elif [ "$1" = "LISTEN" ]
#   then
#     netstat -an | grep "$1" | awk 'BEGIN { FS="." } /./ { print $2 }' | awk -F'[ ]' '{ print ":"$1 }' | xargs -L1 lsof -i | awk '($1 !~ /COMMAND/ && $5 !~ /IPv6/) { print $0 }'
#   fi
# }
