#!/bin/bash

# This script is based in https://oracle-base.com/articles/linux/linux-firewall

# Set the default policies to allow everything while we set up new rules.
# Prevents cutting yourself off when running from remote SSH.
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Flush any existing rules, leaving just the defaults
iptables -F

# Open port 21 for incoming FTP requests.
iptables -A INPUT -p tcp --dport 21 -j ACCEPT

# Open port 22 for incoming SSH connections.
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
# Limit to eth0 from a specific IP subnet if required.
#iptables -A INPUT -i eth0 -p tcp -s 192.168.122.0/24 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT

# Open port 80 for incoming HTTP requests.
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
# Open port 443 for incoming HTTPS requests. (uncomment if required)
#iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# *** Put any additions to the INPUT chain here.
#
# *** End of additions to INPUT chain.

# Accept any localhost (loopback) calls.
iptables -A INPUT -i lo -j ACCEPT

# Allow any existing connection to remain.
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Reset the default policies to stop all incoming and forward requests.
iptables -P INPUT DROP
iptables -P FORWARD DROP
# Accept any outbound requests from this server.
iptables -P OUTPUT ACCEPT

# Save the settings.
service iptables save
# Use the following command in Fedora
#iptables-save > /etc/sysconfig/iptables

# Display the settings.
iptables -L -v --line-numbers