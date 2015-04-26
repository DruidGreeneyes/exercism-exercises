(in-package #:cl-user)
(defpackage #:phone
  (:use #:common-lisp)
  (:export #:numbers #:area-code #:pretty-print))

(in-package #:phone)

(defun remove-nans (str)
  (remove-if-not #'digit-char-p str))

(defun ensure-phone-number (digits)
  (let ((len (length digits)))
    (cond ((= 10 len) digits)
          ((and (= 11 len) 
                (char= #\1 (char digits 0)))
             (subseq digits 1))
          (t "0000000000"))))
          
(defun prettify-digits (digits)
  (format nil "(~a) ~a-~a" (subseq digits 0 3) 
                           (subseq digits 3 6)
                           (subseq digits 6)))

(defun numbers (phone-number)
  (ensure-phone-number (remove-nans phone-number)))

(defun pretty-print (phone-number)
  (prettify-digits (numbers phone-number)))

(defun area-code (phone-number)
  (subseq (numbers phone-number) 0 3))