(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth #:on-mercury #:on-venus #:on-mars #:on-jupiter #:on-saturn #:on-uranus #:on-neptune))

(in-package #:space-age)

(defconstant s (float 31557600))
(defconstant +planets+ (list ("earth" . 1)
                             ("mercury" . 0.2408467)
                             ("venus" . 0.61519726)
                             ("mars" . 1.8808158)
                             ("jupiter" . 11.862615)
                             ("saturn" . 29.447498)
                             ("uranus" . 84.016846)
                             ("neptune" . 164.79132)))

(defun round-to-two (n)
  (and (floatp n)
       (/ (round (* n 100)) 100)))
       
(defun def-on-planet (planet multiplier)
  (let ((name (concatenate 'string "on-" planet))
        (secs-per-year (* s multiplier)))
    (setf (fdefinition planet)
          (lambda (secs) 
            (round-to-two (/ secs secs-per-year))))))

(loop for p in +planets+ do
  (def-on-planet (car p) (cdr p)))