#!/bin/bash

sudo tcpdump -G 600 -C 2 -i any port 22 -w /tmp/captured_ssh_attempts.pcap