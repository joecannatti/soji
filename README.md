# Soji [![Build Status](https://travis-ci.org/joecannatti/soji.svg?branch=master)](https://travis-ci.org/joecannatti/soji)

Soji is a terminal based tool for helping you stay mindful at work.

![Alt text](readme_images/prompt.png?raw=true "Title")


### Concepts

Soji is based on concepts originating in the fields of Psychology, Productivity, and Zen Buddhism.

These include:
  * [Pomodoro Technique](https://en.wikipedia.org/wiki/Pomodoro_Technique)
  * [Premack's Principal](https://en.wikipedia.org/wiki/Premack%27s_principle)
  * [Concentraction meditation -- Samatha](https://en.wikipedia.org/wiki/Samatha)
  * [Awareness meditation -- Shikantaza](https://en.wikipedia.org/wiki/Shikantaza)
  * [Journaling](https://en.wikipedia.org/wiki/Journal_therapy)


### Installation

soji requires the Guile programming language to be installed

Fedora
```
sudo dnf install guile
```

Ubuntu
```
sudo apt install guile
```

Mac
```
brew install guile
```

Mac also requires [brightness](https://github.com/nriley/brightness) and [terminal-notifier](https://github.com/julienXX/terminal-notifier). They can be installed with

```
brew install brightness
brew install terminal-notifier
```

_NOTE: I am developing `soji` on Ubuntu and am currently unsure that it works on any other platform. Please feel free to lend a hand getting it working on your Platform :)_

```
git clone git@github.com:joecannatti/soji.git
cd soji
sudo make install
```

### Setup your prompt

Soji is design to interact with you primarily through your command prompt (as pictured above). 

The standard prompt setup is built into soji. You just need to add to you `.bashrc` or `.bash_profile`

```
PROMPT_COMMAND='PS1="`soji prompt`"'
```

I use a very up to date version of GNU `bash`. I do not know if this will work with other shells, including `zsh`

Soji may be usable without this step, but I've not really tried. You could not have the info in your prompt and just run the commands `soji` and `soji status` to see what's going on.

### The note taking system

A special note file is created for each day called the the `engineering-log`. It's just a markdown file named like, `$SOJI_NOTES_DIR/engineering-log-2016-06-19.md`

Beginning any soji activity adds an entry into this file in the form of

```
** start -- Write Soji README.md -- 01:15PM
```

You are free to add your own notes in that file in between soji's log entries. 

Running the soji command with no args will open this file in `$EDITOR`. (I only use `vi`, so I'm not sure how well this works currently with other editors)

```bash
$ soji
```
I open this file many times everyday. I recommend aliasing `soji` to `s`.

In you `.bashrc`

```
alias s='soji'
```

Then, you can easily pop this file open by running

```bash
$ s
```

### The Pomodoro System

Soji uses the `start` subcommand to begin a pomodoro. 

```bash
$ soji start 'Write README.md'
```

* You will see your current pomodoro status in the prompt (see screenshot above).
* After 25 min, soji will dim you screen(s) to 25%. (only verified as working on Ubuntu currently)
* After another 5 min for the break, it will return the screen brightness to 100%
* The pomodoro count in the command prompt will increment with each pomodoro that you begin.
* The count is color coded based on the number of poms for the day

* 0-3 (Red)

![Alt text](readme_images/1pom.png?raw=true "Title")

* 4-7 (Yellow)

![Alt text](readme_images/5pom.png?raw=true "Title")

* 8-up (Green)

![Alt text](readme_images/8pom.png?raw=true "Title")



### All commands

* `soji start`

> Begins a pomodoro. This commands creates an entry in the `engineering-log` and schedules a screen dim and break for 25 min

* `soji dim`

> Dims the screen to 30% brightness. (Only works on Ubuntu)

* `soji report`

> Displays a summary for the day's data

* `soji log`

> Sort of a private function. Handles writing to the engineering-log file

* `soji note`

> Opens today's log file. Can also open one off notes by supplying an arg for the name of the file

* `soji header`

> Prints the colorized header to be added to your bash prompt

* `soji break`

> Begins a break. Dims the screen. Schedules the screen to return to full brightness in 5 min.

* `soji meeting`

> Begins a meeting 

* `soji bright`

> Brings the screen to 100% brightness. (Only works on Ubuntu)

* `soji heart-sutra`

> Begins the Heart Sutra chant in the terminal

* `soji lunch`

> Begins lunch

* `soji meditate`

> Begins unguided meditation 

* `soji note journal`

> Write a journal entry for the day


### Tech Stuff

Soji is written in pure bash (for the time being)
It uses a library called bats for automated testing.
Tests can be run locally with `make`
