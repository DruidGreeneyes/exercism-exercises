module Accumulate (accumulate) where

accumulate :: (t -> a) -> [t] -> [a]
accumulate _ [] = []
accumulate fn (hd:tl) = fn hd : accumulate fn tl
