#!/bin/bash
# Change the host for the one you want to check. It can check against IPs as well.
# The parameter for -G is the time it preserves the packet capture file, in seconds, before wiping it out.
# The parameter for -C is the maximum size of the file in millions of bytes. For example: 2 would be 2.000.000 bytes.

sudo tcpdump -#XXtttt -G 600 -C 2 -w /tmp/reaching_google_https.pcap host www.google.com and port 443