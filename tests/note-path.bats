#!/usr/bin/env bats

. tests/support.sh

@test "returns the eng log for the day" {
    run soji note-path log
    [[ $output =~ engineering-log-`date +%Y-%m-%d`.md ]]
  }

@test "gets yesterdays log" {
    run soji note-path log 1
    [[ $output =~ engineering-log-`date +%Y-%m-%d --date yesterday`.md ]]
  }

@test "creates a timestamp based note" {
    run soji note-path ts
    [[ $output =~ note-`date +%Y-%m-%d-at-%H:%M`.md ]]
  }

@test "defaults to a timestamp based note" {
    run soji note-path
    [[ $output =~ note-`date +%Y-%m-%d-at-%H:%M`.md ]]
  }

@test "creates a named note" {
    run soji note-path test-note-name
    [[ $output =~ test-note-name.md ]]
  }
