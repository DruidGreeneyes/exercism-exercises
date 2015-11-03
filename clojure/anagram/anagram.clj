(ns anagram)

(require '[clojure.string :as s])

(defn anagram? [str1 str2]
  (let [s1 (s/lower-case str1)
        s2 (s/lower-case str2)]
    (and (not= s1 s2)
         (= (sort s1) (sort s2)))))

(defn anagrams-for [str strs]
  (filter (fn [x] (anagram? str x)) strs))
