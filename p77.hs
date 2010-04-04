
cycles n = take' $ iterate next n where
    next 1 = 1
    next n | odd n = 3*n+1
    next n = floor $ realToFrac n/2
    take' (x:1:xs) = [x,1]
    take' (x:xs) = x : take' xs

run = fst . foldl1 cmp $ map (\x -> (x, length $ cycles x)) [1..100000] where
    cmp (a1,l1) (a2,l2)
        | l1 > l2 = (a1,l1)
        | otherwise = (a2,l2)

