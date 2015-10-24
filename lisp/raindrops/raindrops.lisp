(defpackage #:raindrops
  (:use #:common-lisp)
  (:export #:convert))

(in-package #:raindrops)

(defparameter *sounds*
  (list
   (cons 3 "Pling")
   (cons 5 "Plang")
   (cons 7 "Plong")))

(defun has-factor? (n i)
  (= 0 (mod n i)))

(defun generate-sounds (n alst)
  (and (consp alst)
       (if (has-factor? n (caar alst))
		   (concatenate 'string
                        (cdar alst)
						(generate-sounds n (cdr alst)))
		   (generate-sounds n (cdr alst)))))

(defun convert (n)
  (let ((sounds (generate-sounds n *sounds*)))
    (format nil "~A" (or sounds n))))
