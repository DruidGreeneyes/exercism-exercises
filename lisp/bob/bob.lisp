(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun silence-p (str)
  (string= "" (string-trim " " str)))

(defun has-alpha-chars-p (str)
  (find-if #'alpha-char-p str))

(defun all-caps-p (str)
  (string= str (string-upcase str)))

(defun yelling-p (str)
  (and (has-alpha-chars-p input)
       (all-caps-p input)))

(defun question-p (str)
  (char= #\? (char str (- (length str) 1))))

(defun response-for (input)
  (cond ((silence-p input) "Fine. Be that way!")
        ((yelling-p input) "Whoa, chill out!")
        ((question-p input) "Sure.")
        (t "Whatever.")))
