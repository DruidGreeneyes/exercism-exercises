(defpackage #:squares
  (:use #:cl)
  (:export #:sum-of-squares
           #:square-of-sums
           #:difference))

(in-package #:squares)

(defun sqr (x)
  (* x x))

(defun range-to (n)
  (loop for i from 1 to n collect i))

(defun sum-of-squares (n)
  (apply #'+ (mapcar #'sqr (range-to n))))

(defun square-of-sums (n)
  (sqr (apply #'+ (range-to n))))
        
(defun difference (n)
  (- (square-of-sums n) (sum-of-squares n)))