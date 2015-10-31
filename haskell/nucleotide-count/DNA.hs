module DNA (count, nucleotideCounts) where

import Data.Map (Map, fromList)

nucs :: String
nucs = "ATCG"
    
isNuc :: Char -> Bool
isNuc c
    | c `elem` nucs = True
    | otherwise     = error (concat ["invalid nucleotide '", [c], "'"])

counting :: String -> Char -> Int
counting str nuc = length $ filter (== nuc) str
    
count :: Char -> String -> Int
count nuc str
    | isNuc nuc && all isNuc str = counting str nuc
    | otherwise                  = error ""

nucleotideCounts :: String -> Map Char Int
nucleotideCounts "" = fromList [('A', 0), ('T', 0), ('G', 0), ('C', 0)]
nucleotideCounts str
    | all isNuc str = fromList $ zip nucs $ map (counting str) nucs
    | otherwise     = error ""
