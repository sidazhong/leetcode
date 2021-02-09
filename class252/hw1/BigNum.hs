{-
  Name: <Sida ZHong>
  Class: CS 252
  Assigment: HW1
  Date: <Date assignment is due>
  Description: <Describe the program and what it does>
-}

module BigNum (
  BigNum,
  bigAdd,
  bigSubtract,
  bigMultiply,
  bigEq,
  bigDec,
  bigPowerOf,
  prettyPrint,
  stringToBigNum,
) where

type Block = Int -- An Int from 0-999
type BigNum = [Block]
maxblock = 1000


bigAdd :: BigNum -> BigNum -> BigNum
bigAdd x y = bigAdd' x y 0

bigAdd' :: BigNum -> BigNum -> Block -> BigNum
bigAdd' [] [] 0 = []
bigAdd' [] [] z = [z]
bigAdd' x [] z = bigAdd' x [0] z
bigAdd' [] y z = bigAdd' [0] y z
bigAdd' (x:xs) (y:ys) z 
  | x+y < maxblock = rs1: (bigAdd' xs ys 0)
  | x+y >= maxblock = rs2: (bigAdd' xs ys 1)
  where
    rs1 = x+y+z  --z is the previous round, not current round
    rs2 = x+y-maxblock



bigSubtract :: BigNum -> BigNum -> BigNum
bigSubtract x y =
  if length x < length y
    then error "Negative numbers not supported"
    else reverse $ stripLeadingZeroes $ reverse result
      where result = bigSubtract' x y 0

stripLeadingZeroes :: BigNum -> BigNum
stripLeadingZeroes (0:[]) = [0]
stripLeadingZeroes (0:xs) = stripLeadingZeroes xs
stripLeadingZeroes xs = xs

-- Negative numbers are not supported, so you may throw an error in these cases
bigSubtract' :: BigNum -> BigNum -> Block -> BigNum
bigSubtract' [] [] 0 = []
bigSubtract' [] [] z = [z]
bigSubtract' x [] z = bigSubtract' x [0] z
bigSubtract' [] y z = bigSubtract' [0] y z
bigSubtract' (x:xs) (y:ys) z 
  | x-y >= 0 = rs1: (bigSubtract' xs ys 0)
  | x-y < 0 = rs2: (bigSubtract' xs ys 1)
  where 
    rs1 = x-y-z
    rs2 = x-y+maxblock







bigEq :: BigNum -> BigNum -> Bool
bigEq _ _ = error "Your code here"

bigDec :: BigNum -> BigNum
bigDec x = bigSubtract x [1]

-- Handle multiplication following the same approach you learned in grade
-- school, except dealing with blocks of 3 digits rather than single digits.
-- If you are having trouble finding a solution, write a helper method that
-- multiplies a BigNum by an Int.



bigMultiply :: BigNum -> BigNum -> BigNum
bigMultiply x [0] = [0]
bigMultiply [0] y = [0]
bigMultiply x y = bigMultiply' x y 0

-- 3 * 4 =12     [3] [4]  --->  [12]
-- 3001074098 * 4 =  [98,74,1,3] [4]	---> [392,296,4,12]
-- putStrLn $ show $ bigMultiply [500,1] [9]
-- putStrLn $ show $ bigMultiply [500,1] [9] ---> [500,13]
-- putStrLn $ show $ bigMultiply [500,1] [900] ---> [0,350,1]
-- putStrLn $ show $ bigMultiply [111,11] [100] ----> [100][111][1]

bigMultiply' :: BigNum -> BigNum -> Block -> BigNum
bigMultiply' [] y 0 = []
bigMultiply' [] y z = [z]
--bigMultiply' _ [] _ = []
--bigMultiply' _ [0] _ = [0]
bigMultiply' (x:xs) [y] z 
  | x*y+z < maxblock = rs1: (bigMultiply' xs [y] 0)
  | x*y >= maxblock = rs2: (bigMultiply' xs [y] (x*y `quot` maxblock))
  | x*y+z >= maxblock = bigAdd [x*y] [z]
  where 
    rs1 = x*y+z
    rs2 = x*y `mod` maxblock









bigPowerOf :: BigNum -> BigNum -> BigNum
bigPowerOf _ _ = error "Your code here"

prettyPrint :: BigNum -> String
prettyPrint [] = ""
prettyPrint xs = show first ++ prettyPrint' rest
  where (first:rest) = reverse xs

prettyPrint' :: BigNum -> String
prettyPrint' [] = ""
prettyPrint' (x:xs) = prettyPrintBlock x ++ prettyPrint' xs

prettyPrintBlock :: Int -> String
prettyPrintBlock x | x < 10     = ",00" ++ show x
                   | x < 100    = ",0" ++ show x
                   | otherwise  = "," ++ show x

stringToBigNum :: String -> BigNum
stringToBigNum "0" = [0]
stringToBigNum s = stringToBigNum' $ reverse s

stringToBigNum' :: String -> BigNum
stringToBigNum' [] = []
stringToBigNum' s | length s <= 3 = read (reverse s) : []
stringToBigNum' (a:b:c:rest) = block : stringToBigNum' rest
  where block = read $ c:b:a:[]

sig = "9102llaf"
