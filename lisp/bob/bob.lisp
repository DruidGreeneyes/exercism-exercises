(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response-for))
(in-package #:bob)

(defun response-for (input)
  (cond ((equal "" (string-trim " " input)) "Fine. Be that way!")
        ((and (find-if #'alpha-char-p input) 
              (equal input (string-upcase input))) "Whoa, chill out!")
        ((equal #\? (char input (- (length input) 1))) "Sure.")
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