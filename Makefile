all: test

test: prepare_for_tests
	#BEGIN TESTS -------------------
	
	SOJI_DIR=`pwd` SOJI_NOTES_DIR=`pwd`/tests/notes bats tests/*.bats

prepare_for_tests:
	mkdir -p tests/notes
	rm -f tests/notes/*

clean: prepare_for_tests

