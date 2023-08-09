#!/bin/bash
sudo tcpdump -#XXtttt 'tcp[((tcp[12:1] & 0xf0) >> 2):4] = 0x47455420' -w /tmp/http_get_operations.pcap