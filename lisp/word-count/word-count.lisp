(in-package #:cl-user)
(defpackage #:phrase
  (:use #:cl)
  (:export #:word-count))
(in-package #:phrase)

(defun tokenize-string (str &key (test #'alpha-char-p) (start 0))
  (let ((token-start (position-if test str :start start)))
    (if token-start
      (let ((token-end (position-if-not test str :start token-start)))
        (cons (subseq str token-start token-end)
              (if token-end
                  (tokenize-string str :test test :start token-end)))))))
                  
(defun count-duplicates (lis &key (test #'eql))
  (let ((result nil))
    (dolist (item (reverse lis) result)
      (let ((assoc-item (assoc item result :test test)))
        (if assoc-item
            (incf (cdr assoc-item))
            (push (cons item 1) result))))))

(defun word-count (phrase)
  (count-duplicates (tokenize-string (string-downcase phrase) :test #'alphanumericp) :test #'equal))