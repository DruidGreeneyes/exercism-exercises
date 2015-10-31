module Anagram (anagramsFor) where

import Data.List
import Data.Char

isAnagramFor :: String -> String -> Bool
isAnagramFor x y = lx /= ly && sort lx == sort ly
    where lx = map toLower x
          ly = map toLower y

anagramsFor :: String -> [String] -> [String]
anagramsFor s = filter (isAnagramFor s)
