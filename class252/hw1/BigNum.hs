{-
  Name: <Sida ZHong>
  Class: CS 252
  Assigment: HW1
  Date: <Date assignment is due 02/19/2021>
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
  | (x+y+z) < maxblock = (x+y+z) : (bigAdd' xs ys 0)
  | (x+y+z) >= maxblock = ((x+y+z)-maxblock) : (bigAdd' xs ys 1)



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
  | (x-y-z) >= 0 = (x-y-z) : (bigSubtract' xs ys 0)
  | (x-y-z) < 0 = ((x-y-z)+maxblock) : (bigSubtract' xs ys 1)

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
bigMultiply x [y] = bigMultiply' x [y] 0
bigMultiply x (y:ys) = bigAdd (bigMultiply x [y]) ([0]++bigMultiply x ys)

-- putStrLn $ show $ bigMultiply [3] [4] -- [12] -- 3 * 4 =12  
-- putStrLn $ show $ bigMultiply [98,74,1,3] [4] -- [392,296,4,12] 
-- putStrLn $ show $ bigMultiply [500,1] [9] -- [500,13]	-- 500 * 9 -> pass "4" and left "500"
-- putStrLn $ show $ bigMultiply [999] [10] --[990,9]	-- 999 * 10 -> pass "9" and left "990"
-- putStrLn $ show $ bigMultiply [500,1] [900] -- [0,350,1]	-- 500 * 900 -> pass "450" left "1000", and 1*900+450 = 1350 -> pass 1 left 350
-- putStrLn $ show $ bigMultiply [111,11] [100] -- [100][111][1] -- 111 * 100 -> pass 11 and left "100", and 11*100 + 11
-- putStrLn $ show $ bigMultiply [111,1] [111] -- [321,123]
-- putStrLn $ show $ bigMultiply [111,1] [111,1] -- [321][234][1] -- 123321 + 1111000 = 1234321 -- [321,123] + [0,111,1] -- [321,123] + [0]++[111,1]

bigMultiply' :: BigNum -> BigNum -> Block -> BigNum
bigMultiply' [] _ 0 = []
bigMultiply' [] _ z = [z]
bigMultiply' (x:xs) [y] z 
  | (x*y+z) < maxblock = (x*y+z) : (bigMultiply' xs [y] 0)   
  | (x*y+z) >= maxblock = ((x*y+z) `mod` maxblock) : (bigMultiply' xs [y] ((x*y+z) `quot` maxblock))  


-- putStrLn $ show $ bigPowerOf [2] [4] 
-- -> 2 [4]
-- -> 2 * 2 [3] 
-- -> 2 * 2 * 2 [2] 
-- -> 2 * 2 * 2 * 2 [1] 
-- -> 2 * 2 * 2 * 2 
bigPowerOf :: BigNum -> BigNum -> BigNum
bigPowerOf x [0] = [1]
bigPowerOf x [1] = x
bigPowerOf x y = bigMultiply x (bigPowerOf x (bigSubtract y [1]))




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
