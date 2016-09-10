#!/usr/bin/guile \
-e main -s
!#

(define SOJI_DIR "")
(define SOJI_NOTES_DIR "")

(define (load_env_vars)
  (if (eq? (getenv "SOJI_DIR") #f)
      (load-sojirc)))

(define (load-sojirc)
  (load (string-append (getenv "HOME") "/.config/soji/sojirc.scm"))
  (setenv "SOJI_DIR" SOJI_DIR)
  (setenv "SOJI_NOTES_DIR" SOJI_NOTES_DIR))

(define (bind_global_config)
  (set! SOJI_DIR (getenv "SOJI_DIR"))
  (set! SOJI_NOTES_DIR  (getenv "SOJI_NOTES_DIR"))
  '())
  
(define (default-args lst)
  (if (= (length lst) 1) (append lst '("note" "log")) lst))

(define (quote-string str)
  (string-append "'" str "'"))

(define (quote-args lst)
  (map quote-string lst))

(define (system-command-arg-string lst)
  (string-join (list-tail (quote-args (default-args lst)) 1)))

(define (system-command lst)
  (string-append (subcommands-dir-path)
		 (system-command-arg-string lst)))

(define (subcommands-dir-path)
  (string-append SOJI_DIR "/subcommands/"))

(define (main args)
  (load_env_vars)
  (bind_global_config)
  (system (system-command args)))
