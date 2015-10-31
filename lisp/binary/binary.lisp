(defpackage #:binary
  (:use #:common-lisp)
  (:export #:to-decimal))

(in-package #:binary)

(declaim (inline *binary-chars* char-to-binary string-to-binaries))

(defparameter *binary-chars*
  (list #\0 0 #\1 1))

(defun char-to-binary (c)
  (getf *binary-chars* c))

(defun string-to-binaries (str)
  (map 'list #'char-to-binary str))

(defun to-dec (ls &optional (acc 0))
  (if (null ls)
      acc
      (to-dec (rest ls) (ecase (first ls)
                          (0 acc)
                          (1 (+ acc (expt 2 (length (rest ls)))))))))

(defun to-dec-helper (ls)
  (if (member nil ls)
      nil
      (to-dec ls)))

(defun to-decimal (str)
  (or (to-dec-helper (string-to-binaries str))
      0))
