(in-package #:cl-user)
(defpackage #:triangle
  (:use #:cl)
  (:export #:triangle))

(in-package #:triangle)

(defun valid-triangle-p (triangle)
  (let ((max-side (/ (apply #'sum triangle) 2)))
    (find-if #'(lambda (n) (>= n max-side)) triangle)))

