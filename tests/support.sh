function clear_cron {
  crontab -l | grep -v soji | crontab
}

function reset_test_env {
  clear_cron
  rm -rf $SOJI_DIR/tests/notes/*
  if [[ "$CI" != "true" ]]; then
    soji bright
  fi
}

#setup() {
#  reset_test_env
#}

teardown() {
  reset_test_env
}
