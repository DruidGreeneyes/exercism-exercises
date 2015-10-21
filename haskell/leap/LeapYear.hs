 module LeapYear (isLeapYear) where

 isLeapYear :: Integral a => a -> Bool
 isLeapYear y = (mod y 4 == 0) && (mod y 100 /= 0) || (mod y 400 == 0)
