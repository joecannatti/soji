#!/usr/bin/env bats

@test "returns the eng log for the day" {
    run soji note-path log
    [[ $output =~ engineering-log-`date +%Y-%m-%d`.org ]]
  }

@test "gets yesterdays log" {
    run soji note-path log 1
    [[ $output =~ engineering-log-`date +%Y-%m-%d --date yesterday`.org ]]
  }

@test "creates a timestamp based note" {
    run soji note-path ts
    [[ $output =~ note-`date +%Y-%m-%d-at-%H:%M`.org ]]
  }

@test "defaults to a timestamp based note" {
    run soji note-path
    [[ $output =~ note-`date +%Y-%m-%d-at-%H:%M`.org ]]
  }

@test "creates a named note" {
    run soji note-path test-note-name
    [[ $output =~ test-note-name.org ]]
  }

@test "creates a journal note" {
    run soji note-path journal
    [[ $output =~ journal-`date +%Y-%m-%d` ]]
  }
