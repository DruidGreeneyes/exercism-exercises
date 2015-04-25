(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun divisible-by (num target)
  (zerop (rem num target)))

(defun leap-year-p (year)
  (and (divisible-by year 4))
       (or (not (divisible-by year 100))
           (divisible-by year 400)))