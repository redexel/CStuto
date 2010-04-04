import Data.Maybe(fromJust)
import Data.List(elemIndex)

table = table' 1 0 where
    table' l n = take l [n..] : table' (l+1) (n+l)

triangle size = 
    [
        take size $ map (!!x) (drop x table)
        | x <- [0..size]
    ]

sumfind size x = let (r,c) = search x t; t = triangle size in
    sum (takeWhile (<=x) $ t!!r) + sum (takeWhile (<=x) $ map (!!c) t)

search x xs = search' x 0 xs where
    search' x n (xs:xss)
        | x `elem` xs = (n, fromJust $ elemIndex x xs)
        | otherwise = search' x (n+1) xss

run = sumfind 100 5070
