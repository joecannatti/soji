#!/usr/bin/guile \
-e main -s
!#

(load (string-append (getenv "HOME") "/.config/soji/sojirc.scm"))
(setenv "SOJI_DIR" SOJI_DIR)
(setenv "SOJI_NOTES_DIR" SOJI_NOTES_DIR)

(display command-line)

(define (main args)
  (display args)
  (newline))


 
