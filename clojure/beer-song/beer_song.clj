(ns beer-song
  (:use [clojure.pprint :only (cl-format)]
        [clojure.string :only (join)]))

(defn verse-begin [arg1 arg2]
  (cl-format nil "~
~:[No more~;~a~] ~:*bottle~p of beer on the wall, ~0@*~:[no more~;~a~] ~:*bottle~p of beer.~%"
          arg1
          arg2))

(defn verse-end-0 []
  (cl-format nil  "~
Go to the store and buy some more, 99 bottles of beer on the wall.~%"))

(defn verse-end [arg1 arg2]
  (cl-format nil  "~
Take ~:[it~;one~] down and pass it around, ~0@*~:[no more~;~a~] ~:*bottle~p of beer on the wall.~%"
          arg1 arg2))

(defn verse [n]
  (join (concat (verse-begin (> n 0)
                         n)
                (if (= n 0)
                  (verse-end-0)
                  (verse-end (not= n 1)
                             (- n 1))))))

(defn sing
  ([begin] (sing begin 0))
  ([begin end] (if (< end begin)
                 (loop [counter begin
                        song ""]
                   (if (< counter end)
                     song
                     (recur (- counter 1)
                            (join (concat song
                                          (verse counter)
                                          (if (= counter end) "" "\n")))))))))
