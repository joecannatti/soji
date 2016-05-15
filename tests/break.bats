#!/usr/bin/env bats

. tests/support.sh

@test "creates event file if it doesn't exist" {
    [ `ls -1 $SOJI_EVENTS_DIR | wc -l` -eq 0 ]
    soji break
    [ `ls -1 $SOJI_EVENTS_DIR | wc -l` -eq 1 ]
  }

@test "writes a break row to the existing event file" {
    soji break
    cat `soji events-path` | grep 'break,break,'
    [ $? -eq 0 ]
  }

@test "schedules the screen to brighten" {
    soji break
    crontab -l | grep bright
    [ $? -eq 0 ]
  }
