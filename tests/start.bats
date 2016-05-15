#!/usr/bin/env bats

. tests/support.sh

@test "creates event file if it doesn't exist" {
    [ `ls -1 $SOJI_EVENTS_DIR | wc -l` -eq 0 ]
    soji start 'aoeu'
    [ `ls -1 $SOJI_EVENTS_DIR | wc -l` -eq 1 ]
  }

@test "writes a row to the existing file" {
    soji start 'this row should be there'
    cat `soji events-path` | grep 'start,this row should be there,'
    [ $? -eq 0 ]
  }

@test "schedules a break" {
    soji start 'this row should be there'
    crontab -l | grep break
    [ $? -eq 0 ]
  }

@test "updates the status" {
    run soji status
    [ "$output" = "" ]
    run soji start 'new task'
    run soji status
    echo $output
    [ "$output" = "new task -- 0 min" ]
  }

@test "writes a the start of the task to the log note file" {
    soji start Panda
    cat `soji note-path log` | grep '### Pom -- Panda'
    [ $? -eq 0 ]
  }
