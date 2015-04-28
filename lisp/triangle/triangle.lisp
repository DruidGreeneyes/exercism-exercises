(in-package #:cl-user)
(defpackage #:triangle
  (:use #:cl)
  (:export #:triangle))

(in-package #:triangle)

(defun mean (&rest nums)
  (/ (apply #'+ nums) (length nums)))

(defun invalid-triangle-p (a b c)
  (flet ((invalid-side-p (side) 
           (>= side (mean a b c))))
    (find-if #'invalid-side-p triangle)))

(defun triangle (a b c)
  (when (every #'numberp (list a b c))
        (cond ((= a b c) :equilateral)
              ((invalid-triangle-p a b c) :illogical)
	            ((or (= a b)
	                 (= b c)
	                 (= c a)) :isosceles)
	            (t :scalene))))