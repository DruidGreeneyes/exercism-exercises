(in-package #:cl-user)
(defpackage #:meetup
  (:use #:common-lisp)
  (:export #:meetup))

(in-package #:meetup)

(defun get-day-of-week (date month year)
  (nth-value 6 (decode-universal-time
                 (encode-universal-time 0 0 0 date month year))))

(defun find-month-end (month)
  (let ((mod-month (1+ (mod month 12))))
    (nth-value 3 (decode-universal-time
              (- (encode-universal-time 0 0 0 1 mod-month 1901) 1)))))

(defun get-month-list (month)
  (loop for n from 1 to (find-month-end month)
        collect n))

(defun filter-month (month year day-key)
  (let ((month-list (get-month-list month))
        (dow (translate-day day-key)))
    (remove-if-not #'(lambda (x) (eql (get-day-of-week x month year) dow)) month-list)))

(defun translate-day (day)
  (ccase day (:monday 0)
             (:tuesday 1)
             (:wednesday 2)
             (:thursday 3)
             (:friday 4)
             (:saturday 5)
             (:sunday 6)))

(defun find-nth-day (n-symbol days)
  (if (eql n-symbol :teenth)
      (find-if #'(lambda (n) (< 12 n 20)) days)
      (ccase n-symbol (:first (first days))
                      (:second (second days))
                      (:third (third days))
                      (:fourth (fourth days))
                      (:last (car (last days))))))

(defun find-nth-day-new (n-symbol days)
  (if (eql n-symbol :teenth)
      (find-if #'teen-p days)
      (apply (intern (string n-symbol)) days)))
  
(defun meetup (month year &optional (day-key :monday) (nth-key :first))
  (let ((possible-days (filter-month month year day-key)))
    (list year month (find-nth-day nth-key possible-days))))