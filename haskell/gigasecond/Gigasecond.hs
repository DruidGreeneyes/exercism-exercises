module Gigasecond (fromDay) where

import Data.Time.Clock (UTCTime, addUTCTime)
    
fromDay :: UTCTime -> UTCTime
fromDay = addUTCTime (fromInteger (10^9))
