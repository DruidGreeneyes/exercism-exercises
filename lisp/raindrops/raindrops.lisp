(defpackage #:raindrops
  (:use #:common-lisp)
  (:export #:convert))

(in-package #:raindrops)

(declaim (inline not-factor? valid-sounds add-sound))

(defparameter *sounds*
  (pairlis
   (list 7 5 3)
   (list "Plong" "Plang" "Pling")))

(defun not-factor? (n i)
  (/= 0 (mod n i)))

(defun validate-sounds (n)
  (remove n *sounds* :test #'not-factor? :key #'car))

(defun add-sound (str snd)
  (concatenate 'string str snd))

(defun generate-sounds (alst &optional (str nil))
  (if (atom alst)
      str
      (generate-sounds (cdr alst) (add-sound str (cdar alst)))))

(defun convert (n)
  (let ((sounds (generate-sounds (validate-sounds n))))
    (format nil "~A" (or sounds n))))
