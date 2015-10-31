module SumOfMultiples (sumOfMultiples, sumOfMultiplesDefault) where

multiplesBelow :: Int -> Int -> [Int]
multiplesBelow i n = [n, (2 * n)..(i - 1)]
                  
sumMultiplesBelow :: Int -> Int -> Int
sumMultiplesBelow i n = sum (multiplesBelow i n)   

sumOfMultiples :: [Int] -> Int -> Int
sumOfMultiples ns i = sum (map (sumMultiplesBelow i) ns)

sumOfMultiplesDefault :: Int -> Int
sumOfMultiplesDefault = sumOfMultiples [3, 5]
