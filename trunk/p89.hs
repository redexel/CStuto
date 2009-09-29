--Sloane A000396.
--Because I do not know of any way to efficiently
--generate very large perfect numbers.

import Data.Char
perfects = [
	6,
	28,
	496,
	8128,
	33550336,
	8589869056,
	137438691328,
	2305843008139952128,
	2658455991569831744654692615953842176,
	191561942608236107294793378084303638130997321548169216]

run = sum . map digitToInt . show . sum .
	filter (\x -> last (show x) == '6') $ perfects
