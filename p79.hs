divisors n = sum [ x + n `quot` x | x <- [1..sr], n `mod` x == 0] - n where
	sr = floor $ sqrt (realToFrac n)

--All perfect numbers have the form 2^(p-1)*2^p-1
perfects = filter perfect $ map (\p -> 2^(p-1) * (2^p-1)) [1..] where
	perfect n = divisors n == n
	
run = head . dropWhile (\x-> length (show x) <= 10) $ perfects
