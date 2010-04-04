pandigital n = (all . flip elem) (show n) ['1'..'9']
run = head $ dropWhile (not . pand') $ [0..]
    where pand' n = pandigital $ take 9 (reverse (show (2^n)))
