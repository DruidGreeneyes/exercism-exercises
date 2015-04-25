(in-package #:cl-user)
(defpackage #:grains
  (:use #:cl)
  (:export :square :total))
(in-package #:grains)

(defun square (n) (expt 2 (- n 1)))

(defun total-readable (num) 
  (do* ((x 1 (+ x 1))
        (y 1 (+ y (square x))))
       ((>= x num) y)))
      
(defun total-fast (num) (- (square (+ num 1)) 1))
      
(defun total () (total-fast 64))