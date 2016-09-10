#!/usr/bin/guile \
-e main -s
!#

(define SOJI_DIR "")
(define SOJI_NOTES_DIR "")

(define (load_env_vars)
  (if (eq? (getenv "SOJI_DIR") #f)
      (begin
	(load (string-append (getenv "HOME") "/.config/soji/sojirc.scm"))
	(setenv "SOJI_DIR" SOJI_DIR)
	(setenv "SOJI_NOTES_DIR" SOJI_NOTES_DIR))
      (begin
	(set! SOJI_DIR (getenv "SOJI_DIR"))
	(set! SOJI_NOTES_DIR (getenv "SOJI_NOTES_DIR")))))

(define (bind_global_config)
  (define SOJI_DIR (getenv "SOJI_DIR"))
  (define SOJI_NOTES_DIR  (getenv "SOJI_NOTES_DIR"))
  '())
  
(define (default-args lst)
  (if (= (length lst) 1) (append lst '("note" "log")) lst))

(define (quote-string str)
  (string-append "'" str "'"))

(define (quote-args lst)
  (map quote-string lst))


(define (main args)
  (load_env_vars)
  (bind_global_config)
  (system
   (string-append SOJI_DIR "/subcommands/"
		  (string-join
		   (list-tail
		    (quote-args 
		     (default-args args))
		    1)))))
