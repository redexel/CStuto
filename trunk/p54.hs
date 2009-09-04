import Data.Char
import Data.List
split elem list = (fst, (tail sec)) where
	(fst, sec) = splitAt (fromMaybe i) list
	i = elemIndex elem list
	fromMaybe (Just a) = a

sumd n = sum . map digitToInt $ show n
main = do
	file <- readFile "p54.txt"
	print $ run $ map (split ',') $ lines file where 
		run xs = sumd $ maximum $ map (\(a,b)->((read a) ^ (read b))) xs
