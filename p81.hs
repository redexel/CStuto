import Data.Char
morse = (!!) [0,1,2,3,4,5,4,3,2,1]
run = sum . map (morse . digitToInt) $ show (product [1..100])
