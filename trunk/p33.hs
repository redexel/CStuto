main = do
    file <- readFile "p33.txt"
    print $ 1 + sum' (lines file) where
        sum' xs = sum $ map read xs
