(defpackage #:sieve
  (:use #:cl)
  (:export #:primes-to)
  (:documentation "Generates a list of primes up to a given limit."))

(in-package #:sieve)

(defun divis (i n)
  (= 0 (mod i n)))

(defun primes-to (num)
  (if (= num 2) (list 2)
      (loop for i from 3 by 2 to num
         unless (member i acc :test #'divis)
         collect i into acc
         finally (return (cons 2 acc)))))
