(in-package #:cl-user)
(defpackage #:school
  (:use #:common-lisp)
  (:export #:school #:make-school #:add #:grade-roster #:grade #:sorted))
(in-package #:school)

(defclass school ()
  ((roster :accessor roster
           :reader read-roster
           :initform nil)))

;;
;;;Internal Functions
;;access/modify functions
(defun create-school ()
  (make-instance 'school))

(defun create-grade (grade-num &optional (students nil))
  (list :grade grade-num :students students))

(defun find-grade-in-roster (roster grade-num)
  (find grade-num roster :key #'second))

(defmethod get-grade ((school school) grade-num)
  (find-grade-in-roster (roster school) grade-num))

(defmethod add-student ((school school) grade-num stu-name)
  (let ((gr (get-grade school grade-num)))
    (if gr
        (push stu-name (getf gr :students))
        (push (create-grade grade-num (list stu-name))
              (roster school)))))

(defun sort-roster (roster)
  (let ((sorted-roster nil))
    (dolist (gr roster)
      (let ((sorted-students (sort (getf gr :students) #'string<)))
        (push (list :grade (second gr) :students sorted-students)
              sorted-roster)))
    (sort sorted-roster #'< :key #'second)))


;;read functions
(defmethod read-grade ((school school) grade-num)
  (find-grade-in-roster (read-roster school) grade-num))

(defmethod read-students ((school school) grade-num)
  (getf (read-grade school grade-num) :students))

;;
;;;External Functions
(defun make-school ()
  (create-school))

(defun add (school student grade)
  (add-student school grade student))

(defun grade-roster (school)
  (read-roster school))

(defun grade (school grade)
  (read-students school grade))

(defun sorted (school)
  (sort-roster (read-roster school)))
