all: test

test: prepare_for_tests
	#BEGIN TESTS -------------------
	
	SOJI_DIR=`pwd` SOJI_EVENTS_DIR=`pwd`/tests/event_logs SOJI_NOTES_DIR=`pwd`/tests/notes bats tests/*.bats

prepare_for_tests:
	mkdir -p tests/event_logs
	mkdir -p tests/notes
	rm -f tests/event_logs/*
	rm -f tests/notes/*

clean:

