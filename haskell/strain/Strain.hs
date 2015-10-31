module Strain (keep, discard) where

filter' :: Bool -> [a] -> (a -> Bool) -> [a] -> [a]
filter' _ acc _ []    = acc
filter' b acc f (h:t) = filter' b a f t
    where a = if (if b then f h else not(f h))
              then acc ++ [h]
              else acc

keep :: (a -> Bool) -> [a] -> [a]
keep = filter' True []

discard :: (a -> Bool) -> [a] -> [a]
discard = filter' False []
