import Char(digitToInt)
wds = words "no pa re ci vo mu xa ze bi so"
wds_o = [1,0,0,0,1,0,0,0,0,1]
os n = sum . map ((wds_o !!) . digitToInt) $ show n
lojban n = concatMap ((wds !!) . digitToInt) $ show n
run = lojban . sum $ map os [1..10000]
