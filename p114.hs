-- Replaced the commas with spaces to make it a bit easier to parse.
import Data.List
main = mapM_ print . run . map (map read . words) . (\x->x++x) . lines 
    =<< readFile "p114.txt"
run xs = scanr1 next $ transpose xs where
    plusmin l a b c = l + min (min a b) c
    next a b = zipWith4 plusmin a b (tail b ++ [head b]) (last b:init b)
