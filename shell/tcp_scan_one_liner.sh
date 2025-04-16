# Use directly in the terminal, remember to change the IP and range of ports.
for port in $(seq 1 65000); do (echo danithehack3r >/dev/tcp/192.160.0.200/$port && echo "Port $port open") 2> /dev/null; done
