(in-package #:cl-user)
(defpackage #:gigasecond
  (:use #:cl)
  (:export #:from))
(in-package #:gigasecond)

(defun from (year month day hour minute second)
  (multiple-value-bind (s m h d n y)
      (decode-universal-time (+ (expt 10 9) 
                                (encode-universal-time 
                                  second 
                                  minute 
                                  hour 
                                  day 
                                  month 
                                  year)))
    (list y n d h m s)))