#!/bin/bash

# This script is for /24 networks only
SUBNET="$1"
TIMEOUT="${2:-1}" # Default 1 second timeout

if [ -z "$SUBNET" ]; then
    echo "Usage: $0 <subnet_prefix> [timeout]"
    echo "Example: $0 172.16.1 1"
    exit 1
fi

for i in $(seq 1 254); do
    IP="$SUBNET.$i"
    if ping -c 1 -W "$TIMEOUT" "$IP" >/dev/null 2>&1; then
        echo "Host $IP is UP"
    fi
done
