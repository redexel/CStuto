import Data.Char

evenVowel s = even $ length (filter isVowel s) where
    isVowel c = c `elem` "aeiou"
digits3 s = (length (filter isDigit s)) >= 3
alphanum3 s = (length (filter (not . isAlphaNum) s)) <= 3
nobq s = all (\x->x/='b'&&x/='q') s

main = do
    file <- readFile "p36.txt"
    print $ length $ filter isValid $ lines file where
        isValid s = evenVowel s && digits3 s && alphanum3 s && nobq s
