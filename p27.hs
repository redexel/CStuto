perfect n = n == (floor (sqrt (realToFrac n)))^2
run = sum $ map (sqrt . realToFrac) $ filter (not . perfect) [2..10000]
