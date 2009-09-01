import Data.List

type Coord = (Integer, Integer)

split :: Char -> String -> Coord
split elem list = (read fst :: Integer, read (tail sec) :: Integer) where
	(fst, sec) = splitAt (fromMaybe i) list
	i = elemIndex elem list
	fromMaybe (Just a) = a

inThirdQ c
	| fst c <0 && snd c <0 = True
	| otherwise = False

main = do
	file <- readFile "p11.txt"
	let nline = lines file
	let coords = map (split ',') nline
	print $ length (filter inThirdQ coords)
