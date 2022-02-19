#!/bin/bash
echo "Hostname:      $(hostname)"
echo "IP address:    $(ip addr show eth0 | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')"

