import Data.List

binary = reverse . binary' where
    binary' 0 = ""
    binary' x = let (d,m) = x `divMod` 2 in
        (show m) ++ binary' d

run = sum . take 1000 . filter (\x -> x `mod` 19 == 0) $
    map (read . binary) [1..]
