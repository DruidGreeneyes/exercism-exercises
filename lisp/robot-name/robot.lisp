(in-package #:cl-user)
(defpackage #:robot
  (:use #:common-lisp)
  (:export #:build-robot #:robot-name #:reset-name))

(in-package #:robot)

;;
;;;Utility Functions

(defun make-name (parts)
  (format nil "~{~a~}" parts))

(defun tail-push (item lis)
  "Push, but attach item to tail of lis."
  (setf lis (append lis (if (listp item)
                            item
                          (list item)))))

(defun permute-names (lis &key (chars nil))
  (let* ((str (car lis))
         (res (cdr lis))
         (at-end (endp res)))
    (loop for c across str 
          if at-end collect (make-name (reverse (cons c chars)))
          else append (permute-names res :chars (cons c chars)))))

(defun shuffle-list (lis)
  (let ((vec (coerce lis 'vector))
        (len (- (length lis) 1)))
    (loop for i from len downto 0
          do (rotatef (aref vec (random len))
                      (aref vec i))
          finally (return (coerce vec 'list)))))

(defun generate-possibles (&rest sources)
  (shuffle-list (permute-names sources)))

;;
;;;Main Body

(defconstant +s1+ "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
(defconstant +s2+ "0123456789")
(defparameter *possibles* (generate-possibles +s1+ +s1+ +s2+ +s2+ +s2+))

(defstruct (robot (:constructor build-robot))
  (name (new-name)))

(defun new-name ()
  (pop *possibles*))

(defun reset-name (robot)
  (let ((name (robot-name robot))
        (new-robot-name (new-name)))
    (tail-push name *possibles*)
    (setf (robot-name robot) new-robot-name)))
