#!/usr/bin/env bats

. tests/support.sh

setup() {
  reset_test_env
}

teardown() {
  reset_test_env
}



@test "creates event file if it doesn't exist" {
    [ `ls -1 $SOJI_EVENTS_DIR | wc -l` -eq 0 ]
    soji start 'aoeu'
    [ `ls -1 $SOJI_EVENTS_DIR | wc -l` -eq 1 ]
  }

@test "writes a row to the existing file" {
    soji start 'this row should be there'
    cat $SOJI_EVENTS_DIR/*.csv | grep 'start,this row should be there,'
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
