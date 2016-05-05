#!/usr/bin/env bash

echo "lunch,lunch,`date +'%s'`" >> $SOJI_DIR/events-`date +%Y-%m-%d`.csv
echo -e "\n### LUNCH -- `date +'%I:%M%p'`" >> "$SOJI_NOTE_DIR/engineering-notebook-`date +%Y-%m-%d`.md"
