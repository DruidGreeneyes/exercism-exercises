(defpackage #:sieve
  (:use #:cl)
  (:export #:primes-to)
  (:documentation "Generates a list of primes up to a given limit."))

(in-package #:sieve)

(defun vector-of-nums (num)
  (let ((nums-vec (make-array 1 :initial-contents '(2) :adjustable t :fill-pointer 1)))
    (loop for i from 3 to num by 2 do
         (vector-push-extend i nums-vec))
    nums-vec))

(defun sieve (num nums-vec)
  (let ((run-limit (sqrt num)))
    (loop for s from 3 by 2 to run-limit
       if (find s nums-vec) do
         (loop for i from (* s s) by (* 2 s) to (1- num) do
              (setf nums-vec (remove i nums-vec))))
    (concatenate 'list nums-vec)))

(defun primes-to (num)
  (sieve num (vector-of-nums num)))
