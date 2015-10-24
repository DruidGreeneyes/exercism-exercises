module Grains (square, total) where
    
square :: Integer -> Integer
square n = 2 ^ (n - 1)

findTotal :: Integer -> Integer
findTotal n = square (n + 1) - 1
              
total :: Integer                 
total = findTotal 64
