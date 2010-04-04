
sums xs = map snd . filter possible . init . zip (map (flip drop xs) [1..]) $
    map (sum . flip take xs) [1..length xs] where
        possible ([], _) = True
        possible (ys, sm) = let
            tl = length . takeWhile (<=sm) $ scanl1 (+) ys
            in if sum (take tl ys) == sm then possible ((drop tl ys), sm) else False

main = do
    f <- readFile "p102.txt"
    print . head . sums . concatMap (map rd . words) . lines $ f where
        rd n = read n :: Int
