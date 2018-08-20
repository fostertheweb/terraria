#!/bin/bash

./TerrariaServer -x64 \
  -config /etc/terraria/serverconfig.txt \
  | tee /var/log/terraria/$(date +"%m_%d_%Y").log
