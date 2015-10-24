module Sublist (Sublist(Equal, Sublist, Superlist, Unequal), sublist) where

data Sublist = Equal | Sublist | Superlist | Unequal deriving (Show)

instance Eq Sublist where x == y = show x == show y

findSublist :: Eq a => [a] -> [a] -> Bool
findSublist x y
       | x == s    = True
       | l < 0     = False
       | otherwise = findSublist x (tail y)
       where l = length y - lx
             s = take lx y
             lx = length x

sublist :: Eq a => [a] -> [a] -> Sublist
sublist x y
    | x == y          = Equal
    | findSublist x y = Sublist
    | findSublist y x = Superlist
    | otherwise       = Unequal
