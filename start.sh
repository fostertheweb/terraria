#!/bin/bash

docker run -it --name terraria \
  -p 7777:7777 \
  -v tsworlds:/etc/terraria:rw \
  -v tsworlds:/usr/terraria/worlds:rw \
  -v tsworlds:/var/log/terraria:rw \
  fostertheweb/terraria
