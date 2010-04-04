import Data.Char
lastsum n = head $ dropWhile (>=10) $ iterate sumdgts n where
    sumdgts n = sum $ map (fromIntegral . digitToInt) (show n)

run = length $ filter (\x->lastsum x ==4) (map (^10) [1..10000])
