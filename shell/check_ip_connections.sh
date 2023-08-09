#!/bin/bash

function check_ip_connections() {
  CURRENT_IPV4=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2)

  if [ -z "$1" ] || ([ "$1" != "ESTABLISHED" ] && [ "$1" != "LISTENING" ])
  then
    echo "Error: Missing argument [connection-status] Please, pass a valid connection status: checkipv4conn [ESTABLISHED|LISTENINGING]"
    return
  fi

  netstat -an | grep "$1"
}
