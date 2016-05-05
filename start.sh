#!/usr/bin/env bash
echo "start,$1,`date +'%s'`" >> $SOJI_DIR/events-`date +%Y-%m-%d`.csv
echo -e "\n### Pom -- $1 -- `date +'%I:%M%p'`" >> "$SOJI_NOTE_DIR/engineering-notebook-`date +%Y-%m-%d`.md"
$SOJI_DIR/schedule_break.sh
