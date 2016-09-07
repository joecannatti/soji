#!/usr/bin/env bats

. tests/support.sh

@test "creates notes file if it doesn't exist" {
    [ `ls -1 $SOJI_NOTES_DIR | wc -l` -eq 0 ]
    run soji start 'aoeu'
    [ `ls -1 $SOJI_NOTES_DIR | wc -l` -eq 1 ]
  }

@test "schedules a break" {
    run soji start 'this row should be there'
    crontab -l | grep break
    [ $? -eq 0 ]
  }

@test "updates the status" {
    run soji status
    [ "$output" = "" ]
    run soji start 'new task'
    run soji status
    [ "$output" = "new task -- 0 min" ]
  }

@test "writes a the start of the task to the log note file" {
    run soji start Panda
    cat `soji note-path log` | grep '** start -- Panda'
    [ $? -eq 0 ]
  }
