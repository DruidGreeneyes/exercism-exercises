module Phone (areaCode, number, prettyPrint) where

import Data.Char
import Text.Printf (printf)
    
number :: String -> String
number p
    | length n == 11 && head n == '1' = tail n
    | length n == 10                  = n
    | otherwise                       = "0000000000"
    where n = filter isDigit p

areaCode :: String -> String
areaCode = take 3 . number

pprint :: String -> String
pprint p = let area = take 3 p
               region = take 3 (drop 3 p)
               suffix = drop 6 p in
           printf "(%s) %s-%s" area region suffix


prettyPrint :: String -> String
prettyPrint = pprint . number
