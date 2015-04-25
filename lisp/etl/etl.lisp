(in-package #:cl-user)
(defpackage #:etl
  (:use #:common-lisp)
  (:export #:transform))

(in-package #:etl)

(defun transform (dataset)
  (let ((result (make-hash-table :test #'string=)))
    (flet ((transformer (k v)
             (dolist (val v)
               (setf (gethash (string-downcase val) result) k))))
      (maphash #'transformer dataset))
    result))