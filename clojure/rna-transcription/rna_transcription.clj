(ns rna-transcription)

(require '[clojure.string :as s])

(defn transcribe [char]
  (case char
    \C \G
    \G \C
    \A \U
    \T \A
    (throw (AssertionError. "NO DICE, COMPADRE"))))

(defn to-rna [str]
  (s/join (map transcribe str)))
