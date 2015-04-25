(defpackage #:dna
  (:use #:cl)
  (:export #:hamming-distance))
(in-package #:dna)

(defun hamming-distance (dna1 dna2)
  "Determine number of mutations between DNA strands by computing the Hamming Distance."
    (if (= (length dna1) (length dna2))
        (do* ((mark 0 (+ mut 1))
              (mut (mismatch dna1 dna2) (mismatch dna1 dna2 :start1 mark :start2 mark))
              (c 0 (+ c 1)))
             ((null mut) c))))