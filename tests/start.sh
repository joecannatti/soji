#!/usr/bin/env bats

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
