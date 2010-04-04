--This mysterious array is actually called a wythoff array.
--A simple syntax error here nearly made me give up..

import Data.List
import Data.Maybe

fibs a b = a : fibs' a b where
    fibs' a b = b : fibs' b (a+b)

search table el = search' 0 table where
    search' r (row:rest)
        | el `elem` row = (r, fromJust $ el `elemIndex` row)
        | otherwise = search' (r+1) rest

table size = map (row size) [0..size]
row size 0 = take size $ fibs 1 2
row size n = let (x,y) = search (table size) n; fb = row size x in
    take size . drop 2 $ fibs n ((fb!!(y+1))+1)

run = table 17 !! 15 !! 15
