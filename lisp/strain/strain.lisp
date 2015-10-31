(defpackage #:strain
  (:use #:common-lisp)
  (:export #:keep #:discard))

(in-package #:strain)

(defmacro make-filter-function (name keep?)
  `(defun ,name (fun lis &optional acc)
     (if (null lis) (reverse acc)
         (progn (,(if keep? 'when 'unless) (funcall fun (car lis))
                  (push (car lis) acc))
                (,name fun (cdr lis) acc)))))

(make-filter-function keep t)

(make-filter-function discard nil)
