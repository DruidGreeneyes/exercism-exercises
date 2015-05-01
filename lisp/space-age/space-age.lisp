(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth #:on-mercury #:on-venus #:on-mars #:on-jupiter #:on-saturn #:on-uranus #:on-neptune))

(in-package #:space-age)

(defconstant s (float 31557600))
(defconstant +planets+ (list (cons "earth" 1)
			     (cons "mercury" 0.2408467)
                             (cons "venus" 0.61519726)
                             (cons "mars" 1.8808158)
                             (cons "jupiter" 11.862615)
                             (cons "saturn" 29.447498)
                             (cons "uranus" 84.016846)
                             (cons "neptune" 164.79132)))

(defun round-to-two (n)
  (and (floatp n)
       (float (/ (round (* n 100)) 100))))
  
(defun def-on-planet (multiplier)
  (let ((secs-per-year (* s multiplier)))
    (lambda (secs)
      (round-to-two (/ secs secs-per-year)))))

(loop for p in +planets+ do
      (let ((name (intern (concatenate 'string "ON-" (string-upcase (car p))))))
        (setf (fdefinition name) (def-on-planet (cdr p)))))
