#!/bin/bash

TARGET="$1"
START_PORT="$2"
END_PORT="$3"

for ((port=START_PORT; port<=END_PORT; port++)); do
    nc -z -w1 "$TARGET" "$port" 2>/dev/null && echo "Port $port is OPEN"
done
