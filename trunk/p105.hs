import Char
wds = words "no pa re ci vo mu xa ze bi so"
lojban n = concatMap ((wds !!) . digitToInt) $ show n
sumpos n = sum . map (\c -> ord c - 96) $ lojban n
{--
Notice that self-descriptive numbers cannot be more than 3 digits. Because the most that
can come from one digit is 37 (4='vo') and a 4 digit number therefore has a maximum sum of
37+37+37+37 which is much less than 1000.
--}
run = product $ filter (\x -> x == sumpos x) [1..999]
