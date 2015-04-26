(in-package #:cl-user)
(defpackage #:triangle
  (:use #:cl)
  (:export #:triangle))

(in-package #:triangle)

(defun invalid-triangle-p (triangle)
  (let ((max-side (/ (apply #'+ triangle) 2)))
    (find-if #'(lambda (n) (>= n max-side)) triangle)))

(defun triangle (side-1 side-2 side-3)
  (cond ((= side-1 side-2 side-3) :equilateral)
	((invalid-triangle-p (list side-1 side-2 side-3)) :illogical)
	((or (= side-1 side-2)
	     (= side-2 side-3)
	     (= side-3 side-1)) :isosceles)
	(t :scalene)))