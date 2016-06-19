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

configure_prompt:
	echo 'RED="\\[\\033[1;31m\\]"' >> ~/.bash_profile
	echo 'YELLOW="\\[\\033[1;33m\\]"' >> ~/.bash_profile
	echo 'GREEN="\\[\\033[1;32m\\]"' >> ~/.bash_profile
	echo 'WHITE="\\[\\033[1;97m\\]"' >> ~/.bash_profile
	echo 'NOCOLOR="\\[\\033[1;0m\\]"' >> ~/.bash_profile
	echo $'PROMPT_COMMAND=\'PS1=\'\`soji header\`\'' >> ~/.bash_profile

clean: prepare_for_tests

