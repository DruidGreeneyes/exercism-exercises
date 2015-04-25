(in-package #:cl-user)
(defpackage #:dna
  (:use #:cl)
  (:export #:to-rna))
(in-package #:dna)

(declaim (inline transcribe))

(defun transcribe (nucleotide)
  (ccase nucleotide (#\G #\C)
                    (#\C #\G)
                    (#\T #\A)
                    (#\A #\U)))

(defun to-rna (strand)
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'string #'transcribe strand))