(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth #:on-mercury #:on-venus #:on-mars #:on-jupiter #:on-saturn #:on-uranus #:on-neptune))

(in-package #:space-age)

(defconstant s (float 31557600))
(defconstant +planets+ (list "EARTH" 1
                             "MERCURY" 0.2408467
                             "VENUS" 0.61519726
                             "MARS" 1.8808158
                             "JUPITER" 11.862615
                             "SATURN" 29.447498
                             "URANUS" 84.016846
                             "NEPTUNE" 164.79132))

(defun round-to-two (n)
  (and (floatp n)
       (float (/ (round (* n 100)) 100))))
  
(defun def-on-planet (multiplier)
  (let ((secs-per-year (* s multiplier)))
    (lambda (secs)
      (round-to-two (/ secs secs-per-year)))))

(loop for p on +planets+ by #'cddr
      do (let ((name (intern (concatenate 'string "ON-" (car p)))))
           (setf (fdefinition name) (def-on-planet (cadr p)))))
