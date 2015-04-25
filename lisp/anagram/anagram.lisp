(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun sort-string (str)
  (let ((s (string-downcase str)))
    (sort s #'char<)))

(defun anagrams-for (str lis)
  (let ((l (remove str lis :key #'string-downcase 
                           :test #'string=))
        (s (sort-string str)))
    (remove s l :key #'sort-string 
                :test #'string/=)))