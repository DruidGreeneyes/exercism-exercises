(defpackage #:squares
  (:use #:cl)
  (:export #:sum-of-squares
           #:square-of-sums
           #:difference))

(in-package #:squares)

(defun sum-of-squares (n)
  (loop for i from 1 to n sum (* i i)))
  
(defun square-of-sums (n)
  (loop for i from 1 to n sum i into y
        finally (return (* y y))))
        
(defun difference (n)
  (- (square-of-sums n) (sum-of-squares n)))