#!/bin/bash
SUBNET="$1"
PORT="${2:-80}" # Default TCP port

for i in $(seq 1 254); do
    IP="$SUBNET.$i"
    if timeout 1 bash -c "echo >/dev/tcp/$IP/$PORT" 2>/dev/null; then
        echo "Host $IP is UP (via TCP/$PORT)"
    fi
done
