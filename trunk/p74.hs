data Date = Date {
    year :: Int,
    month :: Int,
    day :: Int,
    weekday :: Int
} deriving (Show)

nextday (Date y m d w)
    | d < dm m y = Date y m (d+1) (nw w)
    | m < 12 = Date y (m+1) 1 (nw w)
    | otherwise = Date (y+1) 1 1 (nw w)
    where
        dm m y
            | leapyear y = [31,29,31,30,31,30,31,31,30,31,30,31] !! (m-1)
            | otherwise = [31,28,31,30,31,30,31,31,30,31,30,31] !! (m-1)
        nw x = if x == 7 then 1 else x+1
        leapyear y
            | y `mod` 400 == 0 = True
            | y `mod` 100 == 0 = False
            | y `mod` 4 == 0 = True
        leapyear _ = False

--Jan 1 1901 was a Tuesday
run = length $ filter p $ takeWhile (\d -> year d < 2001) $ iterate nextday (Date 1901 1 1 2)
    where p d = (weekday d == 5) && ((day d `mod` 3 == 0) || (day d `mod` 5 == 0))
