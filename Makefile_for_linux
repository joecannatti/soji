all: test

test: prepare_for_tests
	SOJI_DIR=`pwd` PATH="`pwd`:$$PATH" SOJI_NOTES_DIR=`pwd`/tests/notes bats tests/*.bats

prepare_for_tests: copy_scm_files_to_bins
	mkdir -p tests/notes
	rm -f tests/notes/*

install: copy_scm_files_to_bins
	mkdir -p ~/.config/soji/notes
	cp ./soji ~/.config/soji/soji
	cp -r subcommands ~/.config/soji/
	>~/.config/soji/sojirc
	>~/.config/soji/sojirc.scm
	echo "export SOJI_DIR=~/.config/soji" >> ~/.config/soji/sojirc
	echo "export SOJI_NOTES_DIR=~/.config/soji/notes" >> ~/.config/soji/sojirc
	echo "(define SOJI_DIR (string-append (getenv \"HOME\") \"/.config/soji\"))" >> ~/.config/soji/sojirc.scm
	echo "(define SOJI_NOTES_DIR (string-append (getenv \"HOME\") \"/.config/soji/notes\"))" >> ~/.config/soji/sojirc.scm
	sudo ln -fs ~/.config/soji/soji /usr/bin/soji


copy_scm_files_to_bins:
	cp soji.scm soji

clean: prepare_for_tests
