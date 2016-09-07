#!/usr/bin/env bats

. tests/support.sh

@test "writes a lunch log note file" {
    $SOJI_DIR/soji lunch
    cat `$SOJI_DIR/soji note-path log` | grep '** lunch'
    [ $? -eq 0 ]
  }
