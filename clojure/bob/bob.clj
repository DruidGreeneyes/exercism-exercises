(ns bob)

(require '[clojure.string :as s])

(defn alpha? [char]
  (Character/isLetter char))

(defn has-alphas? [str]
  (some alpha? str))

(defn yelling? [str]
  (and (has-alphas? str)
       (= str (s/upper-case str))))

(defn question? [str]
  (= \? (last str)))

(defn response-for [str]
  (cond
    (s/blank? str)  "Fine. Be that way!"
    (yelling? str)  "Whoa, chill out!"
    (question? str) "Sure."
    :else           "Whatever."))
