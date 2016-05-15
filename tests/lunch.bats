#!/usr/bin/env bats

. tests/support.sh

@test "creates event file if it doesn't exist" {
    [ `ls -1 $SOJI_EVENTS_DIR | wc -l` -eq 0 ]
    soji lunch
    [ `ls -1 $SOJI_EVENTS_DIR | wc -l` -eq 1 ]
  }

@test "writes a lunch row to the existing event file" {
    soji lunch
    cat $SOJI_EVENTS_DIR/*.csv | grep 'lunch,lunch,'
    [ $? -eq 0 ]
  }

@test "writes a lunch log note file" {
    soji lunch
    cat $SOJI_NOTES_DIR/*.md | grep '### LUNCH'
    [ $? -eq 0 ]
  }
