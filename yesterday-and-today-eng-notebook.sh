#! /usr/bin/env bash

note_dir=$SOJI_NOTE_DIR
pushd $note_dir && vi -o engineering-notebook-`date --date 'yesterday' +%Y-%m-%d`.md engineering-notebook-`date +%Y-%m-%d`.md && popd
