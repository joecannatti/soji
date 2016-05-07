#!/usr/bin/env bash

action=$1

if [[ $action == 'yn' ]]; then
  action='yesterday-and-today-eng-notebook'
elif [[ $action == 'week' ]]; then
  action='eng-notebook-week'
fi

$SOJI_DIR/$action.sh "$2" "$3" "$4"
