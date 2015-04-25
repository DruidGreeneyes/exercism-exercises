(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)

(defconstant +verse+
  "~:[No more~;~a~] ~2@*~:[bottles~;bottle~] of beer on the wall, ~@*~:[no more~;~a~] ~2@*~:[bottles~;bottle~] of beer.
~@*~:[Go to the store and buy some more, 99 bottles of beer on the wall.~
~;Take ~2@*~:[one~;it~] down and pass it around, ~2@*~:[~a~;no more~] ~4@*~:[bottles~;bottle~] of beer on the wall.~]~%")

(defun verse (n)
  (format nil +verse+
	  (> n 0)
	  n
	  (= n 1)
	  (- n 1)
	  (= n 2)))

(defun sing (begin &optional (end 0))
  (if (< end begin)
      (do ((inc begin (- inc 1))
	   (song "" (format nil "~@[~1@*~a~%~]~2@*~a"
			    (> (length song) 0)
			    song
			    (verse inc))))
	  ((< inc end) (format nil "~a~%" song)))))
