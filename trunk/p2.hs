import Data.Char

sumdigits n = sum [digitToInt x | x <- show n]
run = sumdigits $ 2^50
