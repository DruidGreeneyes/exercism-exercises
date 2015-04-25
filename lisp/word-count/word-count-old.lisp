(in-package #:cl-user)
(defpackage #:phrase
  (:use #:cl)
  (:export #:word-count))
(in-package #:phrase)

(defun tokenize-string (str &key (test #'alpha-char-p) (start 0))
  (let ((start-token (position-if test str :start start)))
    (if start-token
      (let ((end-token (position-if-not test str :start start-token)))
        (cons (subseq str start-token end-token)
              (if end-token
                  (tokenize-string str :test test :start end-token)))))))
                  
(defun compress-list (lis &key (test #'eql))
  (let ((result nil))
    (dolist (item (reverse lis) result)
      (let ((compressed-item (assoc item result :test test)))
        (if compressed-item
            (incf (cdr compressed-item))
            (push (cons item 1) result))))))

(defun word-count (phrase)
  (compress-list (tokenize-string (string-downcase phrase) :test #'alphanumericp) :test #'equal))