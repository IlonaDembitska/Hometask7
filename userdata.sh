#!/bin/bash

# Enable GatewayPorts so reverse tunnel (-R) works externally
sed -i 's/^#\?GatewayPorts .*/GatewayPorts yes/' /etc/ssh/sshd_config || true
grep -q '^GatewayPorts yes$' /etc/ssh/sshd_config || echo "GatewayPorts yes" >> /etc/ssh/sshd_config

# Restart ssh service
systemctl restart ssh || systemctl restart sshd
iptables -I INPUT -p tcp --dport 9999 -j ACCEPT