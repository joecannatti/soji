#!/usr/bin/env bats

. tests/support.sh

@test "writes a break log note file" {
    soji break
    cat `soji note-path log` | grep '** break'
    [ $? -eq 0 ]
  }

@test "schedules the screen to brighten" {
    soji break
    crontab -l | grep bright
    [ $? -eq 0 ]
  }
