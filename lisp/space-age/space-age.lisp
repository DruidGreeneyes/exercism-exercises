(in-package #:cl-user)
(defpackage #:space-age
  (:use #:common-lisp)
  (:export #:on-earth #:on-mercury #:on-venus #:on-mars #:on-jupiter #:on-saturn #:on-uranus #:on-neptune))

(in-package #:space-age)

(defconstant +seconds-per-year-by-planet+ '(("earth" . 31557600.0)
                                           ("mercury" . 7599912.66792)
                                           ("venus" . 19414149.052176)
                                           ("mars" . 59354032.69008)
                                           ("jupiter" . 374355659.124)
                                           ("saturn" . 929292362.8848)
                                           ("uranus" . 2651370019.3296)
                                           ("neptune" . 5200418560.032)))

(defun round-to-two (n)
  (and (floatp n)
       (float (/ (round (* n 100)) 100))))

(defun make-on-planet (sym year)
    (setf (fdefinition sym)
          (on-planet year)))

(defun on-planet (year)
  (lambda (secs)
    (round-to-two (/ secs year)))) 
    
(defun make-on-symbol (str)
  (intern (concatenate 'string "ON-" (string-upcase str))))

(loop for (p . m) in +planets+
      do (make-on-planet (make-on-symbol p) m))
