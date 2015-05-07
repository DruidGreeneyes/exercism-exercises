(in-package #:cl-user)
(defpackage #:school
  (:use #:common-lisp)
  (:export #:school #:make-school #:add #:grade-roster #:grade #:sorted))
(in-package #:school)

(defclass school ()
  ((roster :accessor access-roster
           :reader get-roster
           :initform nil)))

(defclass grade ()
  ((grade-number :reader grade-number
                 :initarg :grade-number
                 :initform 0)
   (students :accessor access-students
             :reader get-students
             :initarg :students
             :initform nil)))

;;
;;;Internal Functions
;;access/modify functions
(defun create-school ()
  (make-instance 'school))

(defun create-grade (grade-num &optional (students nil))
  (make-instance 'grade :grade-number grade-num :students students))

(defun find-grade-in-roster (roster grade-num)
  (find grade-num roster :key #'grade-number))

(defmethod access-grade ((school school) grade-num)
  (find-grade-in-roster (access-roster school) grade-num))

(defmethod add-grade ((school school) grade-num)
  (push (create-grade grade-num) (access-roster school))
  (access-grade school grade-num))

(defmethod ensure-grade ((school school) grade-num)
  (or (access-grade school grade-num)
      (add-grade school grade-num)))

(defmethod add-student-to-grade ((grade grade) stu-name)
  (push stu-name (access-students grade)))

(defmethod add-student ((school school) grade-num stu-name)
  (let ((grade (ensure-grade school grade-num)))
    (add-student-to-grade grade stu-name)))


;;read-only functions
(defmethod get-grade ((school school) grade-num)
  (find-grade-in-roster (get-roster school) grade-num))

(defmethod sort-students (students)
  (sort students #'string<))

(defmethod sort-grade ((grade grade))
  (list :grade (grade-number grade)
        :students (sort-students (get-students grade))))

(defun sort-roster (roster)
  (let ((sorted-roster nil))
    (dolist (grade roster)
      (push (sort-grade grade) sorted-roster))
    (sort sorted-roster #'< :key #'second)))


;;
;;;External Functions
(defun make-school ()
  (create-school))

(defun add (school student grade)
  (add-student school grade student))

(defun grade-roster (school)
  (sort-roster (get-roster school)))

(defun grade (school grade)
  (let ((grade (get-grade school grade)))
    (if grade
        (get-students grade))))

(defun sorted (school)
  (sort-roster (get-roster school)))
