binary n = reverse (rbin n) where
    rbin 0 = []
    rbin x = [rem x 2] ++ rbin (quot x 2)
count1 xs = length $ filter (==1) $ binary (read xs)

main = do
    file <- readFile "p20.txt"
    let nline = lines file
    print $ sum $ map count1 nline
