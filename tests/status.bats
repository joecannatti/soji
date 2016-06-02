#!/usr/bin/env bats

. tests/support.sh

@test "updates the status" {
    run soji status
    [ "$output" = "" ]
    run soji start 'new task'
    run soji status
    [ "$output" = "new task -- 0 min" ]
  }

@test "works with dashes in the task name" {
    run soji status
    [ "$output" = "" ]
    run soji start 'new-task'
    run soji status
    [ "$output" = "new-task -- 0 min" ]
  }
