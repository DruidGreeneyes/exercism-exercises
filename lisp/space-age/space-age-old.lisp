(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth #:on-mercury #:on-venus #:on-mars #:on-jupiter #:on-saturn #:on-uranus #:on-neptune))

(in-package #:space-age)

(defconstant s (float 31557600))

(defun round-to-two (n)
  (and (floatp n)
       (/ (round (* n 100)) 100)))

(defmacro def-on-thing (name secs-per-year)
  `(defun ,name (secs)
     (round-to-two (/ secs ,secs-per-year))))

(def-on-thing on-earth s)
(def-on-thing on-mercury (* s 0.2408467))
(def-on-thing on-venus (* s 0.61519726))
(def-on-thing on-mars (* s 1.8808158))
(def-on-thing on-jupiter (* s 11.862615))
(def-on-thing on-saturn (* s 29.447498))
(def-on-thing on-uranus (* s 84.016846))
(def-on-thing on-neptune (* s 164.79132))