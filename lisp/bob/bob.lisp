(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun silence-p (str)
  (string= "" (string-trim " " str)))

(defun has-alpha-chars-p (str)
  (find-if #'alpha-char-p str))

(defun yelling-p (str)
  (string= str (string-upcase str)))

(defun question-p (str)
  (char= #\? (char str (- (length str) 1))))

(defun response-for (input)
  (cond ((silence-p input) "Fine. Be that way!")
        ((and (has-alpha-chars-p input) 
              (yelling-p input)) "Whoa, chill out!")
        ((question-p input) "Sure.")
        (t "Whatever.")))

;(defun response-for (input) 
;  (if (equal "" (string-trim " " input))
;      "Fine. Be that way!"
;      (if (and (find-if #'alpha-char-p input)
;               (equal input (string-upcase input)))
;          "Whoa, chill out!"
;          (if (equal #\? (char input (- (length input) 1)))
;              "Sure."
;              "Whatever."))))
;      
