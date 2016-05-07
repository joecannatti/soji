#!/usr/bin/env bash
message=$1
min_from_now=$2
crontab -l | { cat; echo "`date +'%M %H %d %m *' --date \"+$min_from_now min\"` $SOJI_DIR/notify.sh '$message'"; } | crontab -
