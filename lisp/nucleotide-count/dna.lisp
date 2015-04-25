(in-package #:cl-user)
(defpackage #:dna
  (:use #:common-lisp)
  (:export #:dna-count #:nucleotide-counts #:invalid-nucleotide))

(in-package #:dna)

(defconstant +dna-chars+ (list #\G #\C #\T #\A))

(define-condition invalid-nucleotide (error)
  ((nucleotide :initarg :nucleotide
               :reader nucleotide)))

(defun validate-nucleotide (nucleotide)
  (if (not (member nucleotide +dna-chars+ :test #'char=))
      (error 'invalid-nucleotide :nucleotide nucleotide)
      nucleotide))

(defun dna-count (nucleotide strand)
  (count (validate-nucleotide nucleotide) strand :test #'char=))

(defun nucleotide-counts (strand)
  (let ((result (make-hash-table)))
    (dolist (nuc +dna-chars+ result)
      (setf (gethash nuc result) (dna-count nuc strand)))))
      
