#! /usr/bin/env bash

note_dir=$SOJI_NOTE_DIR


day_of_week=`date +%u`

if [[ $day_of_week == 1 ]]; then
  pushd $note_dir && vi -o engineering-notebook-`date +%Y-%m-%d`.md && popd
elif [[ $day_of_week == 2 ]]; then
  pushd $note_dir && vi -o engineering-notebook-`date --date 'yesterday' +%Y-%m-%d`.md engineering-notebook-`date +%Y-%m-%d`.md && popd
elif [[ $day_of_week == 3 ]]; then
  pushd $note_dir && vi -o engineering-notebook-`date --date '-2 days' +%Y-%m-%d`.md engineering-notebook-`date --date 'yesterday' +%Y-%m-%d`.md engineering-notebook-`date +%Y-%m-%d`.md && popd
elif [[ $day_of_week == 4 ]]; then
  pushd $note_dir && vi -o engineering-notebook-`date --date '-3 days' +%Y-%m-%d`.md engineering-notebook-`date --date '-2 days' +%Y-%m-%d`.md engineering-notebook-`date --date 'yesterday' +%Y-%m-%d`.md engineering-notebook-`date +%Y-%m-%d`.md && popd
else
  pushd $note_dir && vi -o engineering-notebook-`date --date '-4 days' +%Y-%m-%d`.md engineering-notebook-`date --date '-3 days' +%Y-%m-%d`.md engineering-notebook-`date --date '-2 days' +%Y-%m-%d`.md engineering-notebook-`date --date 'yesterday' +%Y-%m-%d`.md engineering-notebook-`date +%Y-%m-%d`.md && popd
fi

