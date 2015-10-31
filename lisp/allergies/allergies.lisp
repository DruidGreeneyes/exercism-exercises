(in-package #:cl-user)
(defpackage #:allergies
  (:use #:common-lisp)
  (:shadow #:list)
  (:export #:allergic-to-p #:list))

(in-package #:allergies)

(defparameter *allergies* (cl:list
                           (cons "cats" 128)
                           (cons "pollen" 64)
                           (cons "chocolate" 32)
                           (cons "tomatoes" 16)
                           (cons "strawberries" 8)
                           (cons "shellfish" 4)
                           (cons "peanuts" 2)
                           (cons "eggs" 1)))

(defun get-allergen (num)
  (rassoc num *allergies* :test #'>=))
(defun get-num (allergen)
  (cdr (assoc allergen *allergies* :test #'string=)))


(defun allergic-to-p (num allergen)
  (>= num (get-num allergen)))

(defun list-rec (num &optional acc)
  (if (> num 0)
      (let* ((alg (get-allergen num))
             (new-num (- num (cdr alg))))
        (pushnew (car alg) acc :test #'string=)
        (list-rec new-num acc))
      acc))

(defun list (num)
  (if (<= num 255) 
      (loop with n = num
         for (alg . val) in *allergies*
         when (>= n val)
         do (decf n val) and
         collect alg)
      (list (- num (cdr (car *allergies*))))))
