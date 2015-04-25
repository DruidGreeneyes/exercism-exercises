(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(defparameter *dna-rna* (pairlis (list #\t #\a #\c #\g)
                                 (list #\A #\U #\G #\C)))

(defun dna-char-p (c) (find c *dna-rna* :test #'char-equal :key #'car))

(defun translate (translations strand)
  (if translations
      (let ((dna-char (car (car translations)))
            (rna-char (cdr (car translations))))
        (substitute rna-char dna-char (swap (cdr translations) strand)))
      str))

(defun to-rna (strand)
  "Transcribe a string representing DNA nucleotides to RNA."
  (if (find-if-not #'dna-char-p strand)
    (error "Invalid characters present in strand!")
    (translate *dna-rna* (string-downcase strand))))