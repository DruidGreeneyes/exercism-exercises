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

(defun add-sound (str snd)
  (concatenate 'string str snd))

(defun generate-sounds (n alst &optional (str nil))
  (if (atom alst) str
      (destructuring-bind ((i . snd) . rest) alst
        (generate-sounds n rest (if (has-factor? n i)
                                    (add-sound str snd)
                                    str)))))

(defun generate-sounds-old (n alst)
  (and (consp alst)
       (if (has-factor? n (caar alst))
           (concatenate 'string
                        (cdar alst)
                        (generate-sounds n (cdr alst)))
           (generate-sounds n (cdr alst)))))

(defun convert (n)
  (let ((sounds (generate-sounds n *sounds*)))
    (format nil "~A" (or sounds n))))
