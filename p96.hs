import Data.List
div9 [a,b,c,d,e,f,g,h,i] = let
	x = read [a,b,c,d,e] :: Int
	y = read [f,g,h,i] :: Int in
		x `mod` y == 0 && x `div` y == 9

run = length . filter div9 $ permutations "123456789"
