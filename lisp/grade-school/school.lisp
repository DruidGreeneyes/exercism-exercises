(in-package #:cl-user)
(defpackage #:school
  (:use #:common-lisp)
  (:export #:school #:make-school #:add #:grade-roster #:grade #:sorted))
(in-package #:school)

(defclass grade-school ()
  ((grade-roster :accessor grade-roster
                 :initform nil)))

(defun make-school ()
  (make-instance 'grade-school))

(defmethod get-grade ((school grade-school) grade-num)
  (let ((roster (grade-roster school)))
    (find grade-num roster :key #'second)))

(defmethod grade ((school grade-school) grade-num)
  (getf (get-grade school grade-num) :students))

(defmethod add ((school grade-school) stu grade-num)
  (let ((gr (get-grade school grade-num)))
    (if gr
        (push stu (grade gr))
        (push (list :grade grade-num :students (list stu))
              (grade-roster school)))))

(defmethod sorted ((school grade-school))
  (let ((roster (grade-roster school))
        (sorted-roster nil))
    (dolist (gr roster (sort sorted-roster #'< :key #'second))
      (let ((sorted-students (sort (getf gr :students) #'string<)))
        (push (list :grade (second gr) :students sorted-students)
              sorted-roster)))))
