import qualified Data.Map as M
import Data.Array

boardsize = 400

--Since it's white to move, all black pieces are effectively the same.
data Piece = King | Queen | Rook | Bishop | Knight | Pawn | Blackpiece | Whitepiece | Empty
    deriving (Show, Eq)

--Store the data as an array, index starting at 0. a!4!1 means first square
--of forth row. Similar to [[Piece]] but with constant time access.
type Board = Array Int (Array Int Piece)

m_ctop = M.fromList $ zip "KQRBNPkqrbnp." [King,Queen,Rook,Bishop,Knight,Pawn,
    Blackpiece,Blackpiece,Blackpiece,Blackpiece,Blackpiece,Blackpiece,Empty]
--Convert from char to datatype.
charToPiece c = let Just k = M.lookup c m_ctop in k
simplifyPiece p = if p `elem` [King,Queen,Rook,Bishop,Knight,Pawn] then Whitepiece else p

readinput = fmap (process . lines) (readFile "p110.txt")

process :: [String] -> Array Int (Array Int Piece)
process lns = array (1,boardsize) $ zip [1..] xs where
    xs = map procrow lns
    --Data is processed row by row, then joined together.
    procrow s = array (1,boardsize) . zip [1..] $ map charToPiece s

allmoves :: Board -> (Int,Int) -> [(Int,Int)]
allmoves board pos@(x,y) = let
    coordtopiece (a,b) = board!a!b
    curpiece = coordtopiece pos
    inbounds (a,b) = not $ a<1 || b<1 || a>boardsize || b>boardsize
    canoccupy cds = inbounds cds && (not . (==Whitepiece) . simplifyPiece . coordtopiece $ cds)
    --keep taking until you reach your own piece(exclude) or enemy piece(include).
    stubstream [] = []
    stubstream (x:_) | not (inbounds x) = []
    stubstream (x:xs) = let r=simplifyPiece (coordtopiece x) in
        case r of
            Empty -> x:stubstream xs
            Blackpiece -> [x]
            Whitepiece -> []
    --moves: get all possible moves on the board for a particular piece.
    moves Blackpiece = []
    moves Empty = []
    moves Pawn = let
        frontsq = filter (\cd -> inbounds cd && coordtopiece cd == Empty) [(x-1,y)]
        diagsqs = filter (\cd -> inbounds cd && coordtopiece cd == Blackpiece) [(x-1,y-1),(x-1,y+1)]
        in frontsq ++ diagsqs
    moves King = filter canoccupy 
        [(x-1,y-1), (x-1,y), (x-1,y+1), (x,y-1), (x,y+1), (x+1,y-1), (x+1,y), (x+1,y+1)]
    moves Knight = filter canoccupy 
        [(x-2,y-1), (x-1,y-2), (x+1,y-2), (x+2,y-1), (x-2,y+1), (x-1,y+2), (x+1,y+2), (x+2,y+1)]
    moves Rook = let
        d_north = stubstream [(x1,y) | x1<-[x-1,x-2..1]]
        d_south = stubstream [(x1,y) | x1<-[x+1,x+2..boardsize]]
        d_west = stubstream [(x,y1) | y1<-[y-1,y-2..1]]
        d_east = stubstream [(x,y1) | y1<-[y+1,y+2..boardsize]]
        in d_north ++ d_south ++ d_west ++ d_east
    moves Bishop = let
        d_northwest = stubstream $ zip [x-1,x-2..1] [y-1,y-2..1]
        d_northeast = stubstream $ zip [x-1,x-2..1] [y+1,y+2..boardsize]
        d_southwest = stubstream $ zip [x+1,x+2..boardsize] [y-1,y-2..1]
        d_southeast = stubstream $ zip [x+1,x+2..boardsize] [y+1,y+2..boardsize]
        in d_northwest ++ d_northeast ++ d_southwest ++ d_southeast
    moves Queen = moves Rook ++ moves Bishop
    in moves curpiece

totalmoves board = sum $ map (\x -> sum $ map (\y -> length (allmoves board (x,y)))
    [1..boardsize]) [1..boardsize]

main = do
    b<-readinput
    print $ totalmoves b

