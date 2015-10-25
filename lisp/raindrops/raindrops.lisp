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

(defun valid-sounds (n)
  (remove n *sounds* :test #'not-factor? :key #'car))

(defun add-sound (str snd)
  (concatenate 'string str snd))

(defun generate-sounds (n alst &optional (str nil))
  (if (atom alst) str
      (destructuring-bind ((_n . snd) . rest) alst
        (declare (ignore _n))
        (generate-sounds n rest (add-sound str snd)))))

(defun convert (n)
  (let ((sounds (generate-sounds n (valid-sounds n))))
    (format nil "~A" (or sounds n))))
