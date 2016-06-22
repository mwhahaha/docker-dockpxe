#!/bin/bash

# run dnsmasq to handle dhcp/tftp
dnsmasq -C /configs/dnsmasq/dnsmasq.conf

# provide pxe folder via http on port 8888
cd /pxe
python3 -m http.server 8888
