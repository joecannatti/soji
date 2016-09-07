#!/usr/bin/env bats

. tests/support.sh

@test "writes a lunch log note file" {
    soji lunch
    cat `soji note-path log` | grep '** lunch'
    [ $? -eq 0 ]
  }
