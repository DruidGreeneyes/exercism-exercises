module DNA (toRNA) where

transcribeChar :: Char -> Char
transcribeChar 'C' = 'G'
transcribeChar 'G' = 'C'
transcribeChar 'A' = 'U'
transcribeChar 'T' = 'A'
transcribeChar _ = '!'


toRNA :: String -> String
toRNA = map transcribeChar
