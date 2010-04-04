import Data.List

seqs x l = map sub [0..length x -l] where
    sub n = take l . drop n $ x
seqs19 x = foldl1 (++) $ map (seqs x) [1..19]
consecs = takeWhile (<10^20) $ map f [1..] where
    f x = product [x..(x+3)]

--Takes 2 minutes to run, uses a lot of memory.
main = do
    file <- readFile "p46.txt"
    print $ run (foldl1 (++) (lines file)) where
        run x = sum $ intersect consecs $ nub (map read (seqs19 x))
