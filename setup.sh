#!/bin/bash

URL="https://terraria.org"
PAGE="/tmp/terraria-org"
ZIP="/tmp/terraria-server.zip"
FILES="/tmp/terraria-server"
APP="/opt/terraria"

# download terraria homepage
curl $URL -o $PAGE

# get server download link
LINK=$(grep "Dedicated Server" $PAGE | cut -d"'" -f2)
VERSION=$(echo $LINK | grep -Po '(?<=-)\d{1,}(?=.zip)')

# download server assets
curl "$URL$LINK" -o $ZIP

# unzip the files
unzip $ZIP -d $FILES

# copy linux files
cp -r "$FILES/$VERSION/Linux" $APP
