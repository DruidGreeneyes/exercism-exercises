(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth #:on-mercury #:on-venus #:on-mars #:on-jupiter #:on-saturn #:on-uranus #:on-neptune))

(in-package #:space-age)

(defconstant s (float 31557600))
(defconstant +planets+ (list "earth" 
                             "mercury"
                             "venus"
                             "mars"
                             "jupiter"
                             "saturn" 
                             "uranus"
                             "neptune"))
(defconstant +multipliers+ (list 1 
                                 0.2408467
                                 0.61519726
                                 1.8808158
                                 11.862615
                                 29.447498
                                 84.016846
                                 164.79132))

(defun round-to-two (n)
  (and (floatp n)
       (float (/ (round (* n 100)) 100))))
  
(defun def-on-planet (multiplier)
  (let ((secs-per-year (* s multiplier)))
    (lambda (secs)
      (round-to-two (/ secs secs-per-year)))))

(loop for p in (pairlis +planets+ +multipliers+) do
      (let ((name (intern (concatenate 'string "ON-" (string-upcase (car p))))))
        (setf (fdefinition name) (def-on-planet (cdr p)))))
