#!/bin/bash
# Change the host for the one you want to check.
sudo tcpdump -#XXtttt -G 60 -C 2 -w /tmp/reaching_google_https.pcap host www.google.com and port 443