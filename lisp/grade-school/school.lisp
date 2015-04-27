(in-package #:cl-user)
(defpackage #:school
  (:use #:common-lisp)
  (:export #:school #:make-school #:add #:grade-roster #:grade #:sorted))
(in-package #:school)

(defclass school ()
  ((roster :reader get-roster
           :writer set-roster
           :initform nil)))

;
;;
;;;Internal Functions

(defun create-school ()
  (make-instance 'school))

(defun create-grade (grade-number &optional (students nil))
  (list :grade grade-number :students students))

(defmethod get-grade ((school school) grade-number)
  (find grade-number (get-roster school) :key #'second))

(defmethod remove-grade ((school school) grade-number)
  "Returns a copy of (get-roster school) from which all grades matching grade-number have been removed."
  (let ((roster (get-roster school)))
    (remove-if #'(lambda (n) (= n grade-number)) roster :key #'second)))
  
(defmethod add-grade ((school school) grade-number)
  (let ((new-roster (cons (create-grade grade-number)
                          (get-roster school))))
    (set-roster new-roster school)))

(defmethod set-grade (new-grade (school school))
  (let* ((grade-number (second new-grade))
         (new-roster (cons new-grade (remove-grade school grade-number))))
    (set-roster new-roster school)))
    
(defmethod ensure-grade ((school school) grade-number)
  (unless (get-grade school grade-number)
          (add-grade school grade-number)))

(defmethod get-students ((school school) grade-number)
  (car (last (get-grade school grade-number))))

(defmethod set-students (grade-number new-students (school school))
  (let ((new-grade (create-grade grade-number new-students)))
    (set-grade new-grade school)))

(defmethod add-student ((school school) grade-number student)
  (ensure-grade school grade-number)
  (let ((new-students (cons student (get-students school grade-number))))
    (set-students grade-number new-students school)))

(defun sort-grade (grade)
  (create-grade (second grade)
                (sort (car (last grade)) #'string<)))
  
(defun sort-roster (school)
  (let ((roster (get-roster school)))
    (loop for gr in roster
          collect (sort-grade gr) into safe-roster
          finally (return (sort safe-roster #'< :key #'second)))))

;
;;
;;;Exported Functions with stupid naming.


(defun make-school ()
  (create-school))

(defun grade-roster (school)
  (get-roster school))

(defun add (school student grade-number)
  (add-student school grade-number student))

(defun grade (school grade-number)
  (get-students school grade-number))

(defun sorted (school)
  (sort-roster school))