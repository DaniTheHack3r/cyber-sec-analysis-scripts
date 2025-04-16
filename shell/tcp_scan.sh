#!/bin/bash

TARGET="$1"
START_PORT="$2"
END_PORT="$3"

if [ -z "$TARGET" ] || [ -z "$START_PORT" ] || [ -z "$END_PORT" ]; then
    echo "Usage: $0 <target_ip> <start_port> <end_port>"
    exit 1
fi

echo "[*] Scanning $TARGET from port $START_PORT to $END_PORT"

for ((port=START_PORT; port<=END_PORT; port++)); do
    timeout 1 bash -c "echo > /dev/tcp/$TARGET/$port" 2>/dev/null && echo "Port $port is OPEN"
done
