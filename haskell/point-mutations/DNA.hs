module DNA (hammingDistance) where

countMismatches :: [(Char, Char)] -> Int -> Int
countMismatches []    i = i
countMismatches (h:t) i = countMismatches t c
    where c = if uncurry (/=) h then i + 1 else i

hammingDistance :: String -> String -> Int
hammingDistance s1 s2 
    | s1 == s2  = 0
    | otherwise = countMismatches (zip s1 s2) 0
