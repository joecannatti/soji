all: test

test: prepare_for_tests
	#BEGIN TESTS -------------------
	
	SOJI_DIR=`pwd` SOJI_NOTES_DIR=`pwd`/tests/notes bats tests/*.bats

prepare_for_tests:
	mkdir -p tests/notes
	rm -f tests/notes/*

install:
	mkdir -p ~/.config/soji
	cp ./soji ~/.config/soji/soji
	cp -r subcommands ~/.config/soji/
	>~/.config/soji/sojirc
	echo "export SOJI_DIR=~/.config/soji" >> ~/.config/soji/sojirc
	echo "export SOJI_NOTES_DIR=~/.config/soji/notes" >> ~/.config/soji/sojirc
	ln -fs ~/.config/soji/soji /usr/bin/soji



clean: prepare_for_tests

