import Data.Char
tr n = n*(n+1) `quot` 2
run = sum . map digitToInt . show $ tr 123456789
