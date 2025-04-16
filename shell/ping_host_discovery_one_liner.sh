# Remember to edit the IP and sequence of ending ip
# This one liner is thought only for /24 networks.
for i in $(seq 1 254); do ping -c 1 -W 1 192.168.0.$i >/dev/null 2>&1 && echo "Host 192.168.0.$i is UP"; done
