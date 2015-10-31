(defpackage #:atbash-cipher
  (:use #:common-lisp)
  (:export #:encode))

(in-package #:atbash-cipher)

(defparameter *cipher* (pairlis
                        (list #\a #\b #\c #\d #\e #\f
                              #\g #\h #\i #\j #\k #\l #\m
                              #\n #\o #\p #\q #\r #\s
                              #\t #\u #\v #\w #\x #\y #\z)
                        (list #\z #\y #\x #\w #\v #\u
                              #\t #\s #\r #\q #\p #\o #\n
                              #\m #\l #\k #\j #\i #\h
                              #\g #\f #\e #\d #\c #\b #\a)))

(defun encode-char (char)
  (let ((ret (cdr (assoc char *cipher*))))
    (if ret ret char)))

(defun process (lis &optional acc)
  (let* ((len (length lis))
         (res (concatenate 'string
                           acc
                           (if (> len 5)
                               (append (butlast lis (- len 5)) (list #\Space))
                               lis))))
    (if (> len 5)
        (process (nthcdr 5 lis) res)
        res)))

(defun encode (plaintext)
  (process (mapcar #'encode-char
                   (remove-if-not #'alphanumericp
                                  (concatenate 'list
                                               (string-downcase plaintext))))))
