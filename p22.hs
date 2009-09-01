import Data.List

split :: Char -> String -> (String,String)
split elem list = (fst, (tail sec)) where
	(fst, sec) = splitAt (fromMaybe i) list
	i = elemIndex elem list
	fromMaybe (Just a) = a

lineSumY x = ((read y1 + read y2)/2) where
	(group1,group2) = split '|' x
	(_,y1) = split ',' group1
	(_,y2) = split ',' group2

main = do
	file <- readFile "p22.txt"
	let nline = lines file
	print $ sum $ map lineSumY nline
