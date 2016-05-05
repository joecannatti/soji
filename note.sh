#!/usr/bin/env bash

note_dir=$SOJI_NOTE_DIR

if [ $# -eq 0 ]; then
 pushd $SOJI_NOTE_DIR && vi note-`date +%Y-%m-%d-at-%H:%M`.md && popd
else
 pushd $SOJI_NOTE_DIR && vi $1.md && popd
fi
