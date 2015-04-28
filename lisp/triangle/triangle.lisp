(in-package #:cl-user)
(defpackage #:triangle
  (:use #:cl)
  (:export #:triangle))

(in-package #:triangle)

(defun non-triangle (a b c)
  "Tests a triangle with sides a b c against Triangle Inequality."
  (let ((side-max (/ (+ a b c) 2)))
    (flet ((valid-side-p (side) 
             (< side side-max)))
      (find-if-not #'valid-side-p (list a b c)))))
    
(defun triangle (a b c)
  (when (every #'numberp (list a b c))
        (cond ((= a b c) :equilateral)
              ((non-triangle a b c) :illogical)
              ((or (= a b)
                   (= b c)
                   (= c a)) :isosceles)
              (t :scalene))))