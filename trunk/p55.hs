import Data.Char
sumd n = sum . map digitToInt $ show n
run = sumd $ product [1..1000]
