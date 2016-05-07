#!/usr/bin/env bash
echo "start,$1,`date +'%s'`" >> $SOJI_DIR/events-`date +%Y-%m-%d`.csv
echo -e "\n### Pom -- $1 -- `date +'%I:%M%p'`" >> "$SOJI_NOTE_DIR/engineering-notebook-`date +%Y-%m-%d`.md"
$SOJI_DIR/schedule_break.sh
$SOJI_DIR/schedule_notification.sh "20 min left! On the task $1" 5
$SOJI_DIR/schedule_notification.sh "15 min left! On the task $1" 10
$SOJI_DIR/schedule_notification.sh "10 min left! On the task $1" 15
$SOJI_DIR/schedule_notification.sh "ONLY 5 min left! On the task $1" 20
