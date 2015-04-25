(in-package #:cl-user)
(defpackage #:phone
  (:use #:common-lisp)
  (:export #:numbers #:area-code #:pretty-print))

(in-package #:phone)

(defun trim-number (num-str)
  (if (= (length num-str) 10)
      num-str
      (subseq num-str 1)))

(defun ensure-phone-number (str)
  (let ((num-str (remove-if-not #'digit-char-p str)))
    (if (or (= (length num-str) 10)
                  (and (= (length num-str) 11)
                       (char= #\1 (char num-str 0))))
        (trim-number num-str)
        "0000000000")))
        
(defun numbers (phone-number)
  (ensure-phone-number phone-number))

(defun pretty-print (phone-number)
  (let ((number (ensure-phone-number phone-number)))
    (format nil "(~a) ~a-~a" (subseq number 0 3) 
                           (subseq number 3 6)
                           (subseq number 6))))

(defun area-code (phone-number)
  (subseq (ensure-phone-number phone-number) 0 3))