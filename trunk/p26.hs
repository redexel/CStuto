import Data.Char

fibs = 0:1:zipWith (+) fibs (tail fibs)
run = length $ filter odd' $ show (fibs !! 1000)
	where odd' n = odd $ digitToInt n
