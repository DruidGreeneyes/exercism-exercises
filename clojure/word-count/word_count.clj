(ns word-count)

(use '[clojure.string :only (lower-case)])

(defn alphanumeric? [char]
  (.contains "abcdefghijklmnopqrstuvwxyz1234567890" (lower-case (str char))))

(defn build-word [fun [chr & rst] result]
  (if (or (= chr nil)
          (not (fun chr)))
    (concat [result] rst)
    (let [word (str result chr)]
      (build-word fun rst word))))

(defn _split-if-not [fun str res]
  (if (empty? str)
    res
    (if (not (fun (first str)))
      (_split-if-not fun (rest str) res)
      (let [[word & tail] (build-word fun str "")
            result (concat [word] res)]
        (_split-if-not fun tail result)))))

(defn split-if-not [fun str]
  (_split-if-not fun str []))

(defn word-count [str]
  (->> str
       (lower-case)
       (split-if-not alphanumeric?)
       (frequencies)))



