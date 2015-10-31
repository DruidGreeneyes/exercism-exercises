
module Bob (responseFor) where

import Data.Char

yelling :: String -> Bool
yelling s = let c = filter isAlpha s in
    not (null c) && c == map toUpper c

responseFor :: String -> String
responseFor s
    | null (words s) = "Fine. Be that way!"
    | yelling s      = "Whoa, chill out!"
    | last s == '?'  = "Sure."
    | otherwise      = "Whatever."
