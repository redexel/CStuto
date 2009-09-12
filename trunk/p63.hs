import Data.Char
ishappy n = (head $ dropWhile (\x -> x/=1 && x/=4) happy) == 1 where
	happy = iterate sqd n
	sqd x = sum $ map ((^2) . digitToInt) (show x)
isprime n |n<2 = False
isprime n = all (notdiv n) $ takeWhile (\x->x*x<=n) [2..(ceiling.sqrt.realToFrac) n] where
	notdiv n x = n `mod` x /= 0

run = sum $ take 10000 . map toInteger . filter (\x -> isprime x && ishappy x) $ [1..]
