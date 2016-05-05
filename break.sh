#!/usr/bin/env bash

$SOJI_DIR/dim.sh
echo "break,break,`date +'%s'`" >> $SOJI_DIR/events-`date +%Y-%m-%d`.csv
crontab -l | { cat; echo "`date +'%M %H %d %m *' --date '+5 min'` $SOJI_DIR/bright.sh"; } | crontab -
