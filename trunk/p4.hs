import Data.Char

value n = value' (toLower n) where
	value' n
		|n=='a' || n=='b' || n=='c' = 2
		|n=='d' || n=='e' || n=='f' = 3
		|n=='g' || n=='h' || n=='i' = 4
		|n=='j' || n=='k' || n=='l' = 5
		|n=='m' || n=='n' || n=='o' = 6
		|n=='p' || n=='r' || n=='s' = 7
		|n=='t' || n=='u' || n=='v' = 8
		|n=='w' || n=='x' || n=='y' = 9
		|otherwise = 1

strval s = product $ map value s
run = strval "Programming Challenges are fun"
