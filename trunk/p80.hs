--Damn this problem is tricky to get right
--So many corner cases.

import Data.Char
import Data.List(sortBy)

same (x:xs) = all (== x) xs
straight cards = same $ zipWith (-) (map snd cards) [1..]
flush cards = same $ map snd cards
threekind cards = same $ map fst cards
pair cards = let [a,b,c] = map fst cards in
    a==b || b==c || a==c

sort = sortBy (\(a,b) (c,d) -> compare a c)
compare' (a,b) (c,d) = compare a c

p2wins cards@[dcards,pcards]
    | best pcards > best dcards = True
    | conflict 0 = highest pcards dcards
    | conflict 1 = highestpair pcards dcards
    | conflict 4 = highest pcards dcards
    | best pcards < best dcards = False
    | otherwise = error (show dcards ++ " ;; " ++ show pcards) where
        best n
            | straight n && flush n = 5
            | flush n = 4
            | straight n = 3
            | threekind n = 2
            | pair n = 1
            | otherwise = 0
        conflict n = best pcards == best dcards && best dcards == n
        highest as bs = let sa = sort as; sb = sort bs in
            case compare' (last sa) (last sb) of
                GT -> True
                LT -> False
                EQ -> case compare' (sa!!1) (sb!!1) of
                    GT -> True
                    LT -> False
                    EQ -> case compare' (head sa) (head sb) of
                        GT -> True
                        LT -> False
        samenum (a,b) (c,d) = a == c
        highestpair as bs = highest [(pair as)] [(pair bs)] where
            pair [a,b,c]
                | samenum a b || samenum b c = b
                | samenum a c = a

main = do
    file <- readFile "p80.txt"
    print . length . filter p2wins . map (map (map convert)) . parse $ lines file where
        parse [] = []
        parse (dealer:players:rest) = [words dealer, take 3 . drop 3 $ words players] : parse rest
        convert [num,suit] = (convnum num, fromEnum suit) where
            convnum 'E' = 10
            convnum 'J' = 11
            convnum 'Q' = 12
            convnum 'V' = 13
            convnum 'Z' = 14
            convnum n = digitToInt n
        display xs@[a,b] = show a ++ " ;; " ++ show b ++ " ;; " ++ (if p2wins xs then "Win: P2" else "Win: P1")


