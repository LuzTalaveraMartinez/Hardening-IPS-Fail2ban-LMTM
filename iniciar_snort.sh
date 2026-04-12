#!/bin/bash
echo "Iniciando el Guardián Snort..."
sudo snort -A console -q -c /etc/snort/snort.conf -i lo
