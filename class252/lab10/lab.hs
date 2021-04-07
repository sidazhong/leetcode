-- ***********************************************************************************
id = \x -> x
-- ===================================================================================


-- ***********************************************************************************
tru = \x -> \y -> x
fls = \x -> \y -> y
test = \cond -> \thn -> \els -> cond thn els

-- 消除第一个\值， 替换消除的值，为 === 消除括号后面第一个值
-- 就是 if then else
-- test true true false
-- ||||
-- (\cond -> \thn -> \els cond thn els)   true true false
--  *****                 ****            ****
-- (\thn -> \els -> true thn els) true false 
--  ****                 ***      ****    
-- (\els -> true true els) false
--  ****              ***  *****

-- true true false
-- (\x -> \y -> x) true false					
--  **          *  ****
-- (\y -> true) false
--  **          *****
-- true

-- false true false
-- (\x -> \y -> y) true false
--  **             ****
-- (\y -> y) false 
--  **    *  *****
-- false

testTru = transBool $ test tru tru fls
testFls = transBool $ test fls tru fls

transBool b = test b "true" "false"
-- b == true -> "true"
-- b == false -> "false"
-- ***********************************************************************************

andd = \b -> \c -> b c fls
-- if b==true then c else false

-- and true true
-- |||
-- (\b -> \c -> b c false) true true
--  **          *          ****
-- (\c -> true c false) true
--  **         *        ****

-- (true true false)
-- |||||
-- (\x -> \y -> x) true false
--  **          *  ****
-- (\y -> true) false
--  **          *****
-- true

-- (false true false)
-- |||||
-- (\x -> \y -> y) true false
--  **             ****
-- (\y -> y) false
--  **       *****
-- false


testAnd1 = transBool $ andd tru tru
testAnd2 = transBool $ andd fls tru

-- ===================================================================================
nott = \b -> b fls tru
-- if b true then false else true

-- not true
-- (\b -> b false true) true
--  **    *             ****
-- (true false true)
--  |||||
-- (\x -> \y -> x) false true
--  **          *  *****
-- (\y -> false) true 
--  **           ****
-- false

-- not false
-- (\b -> b false true) false
--  **    *             *****
-- (false false true)
--  |||||
-- (\x -> \y -> y) false true
--  **             *****
-- (\y -> y) true 
--  **    *  ****
-- true

orr = \b -> \c -> b tru c
-- if b==true then true else c

-- or true false
-- ||
-- (\b -> \c -> b true c) true false
--  **          *         ****
-- (\c -> true true c) false
--  **              *  *****
-- (true ture false)
--  ||||
-- (\x -> \y -> x) true false
--  **          *  ****
-- (\y true) false
--  **       *****
-- true

-- ===================================================================================

testOps1 = transBool $ orr fls (nott fls)
testOps2 = transBool $ nott (orr fls tru)

test1 = transBool $ orr tru fls
test2 = transBool $ nott fls

-- ***********************************************************************************

pair = \f -> \s -> \b -> b f s

myPair = pair tru fls
-- pair tru fls
-- ||||
-- (\f -> \s -> \b -> b f s) true false
--  **                  *    ****  
-- (\s -> \b -> b true s) false
--  **                 *  *****
-- (\b -> b true false)

first = \p -> p tru
second = \p -> p fls

testPairFst = transBool $ first myPair
-- first myPair
-- |||||
-- (\p -> p true) myPair
--  **    *       ******
-- myPair true
-- ||||||
-- (\b -> b true false) true
--  **    *             ****
-- true true false

testPairSnd = transBool $ second myPair
-- ***********************************************************************************

zero  = \s -> \z -> z
one   = \s -> \z -> s z
two   = \s -> \z -> s (s z)
three = \s -> \z -> s (s (s z))

scc = \n -> \s -> \z -> s (n s z)

one'    = scc zero
two'    = scc one
three'  = scc two

transChurchNums n = n (+1) 0

plus = \m -> \n -> \s -> \z -> m s (n s z)

plus' = \m -> \n -> m scc n
test3plus2 = transChurchNums $ plus' three two

multiply = error "TBD"
test3multiply2 = transChurchNums $ multiply three two  

church n = if n == 0
  then
    (\s -> \z -> z)
  else
    (\s -> \z -> s (church (n-1) s z))
    
    
main :: IO ()
main = do
  putStrLn $ show testAnd1
  putStrLn $ show testAnd2
  putStrLn $ show test1
  putStrLn $ show test2
  putStrLn $ show testPairFst
  putStrLn $ show testPairSnd
  putStrLn $ show test3plus2
  putStrLn $ show test3multiply2
-- ***********************************************************************************

isZero = \n -> n (\x -> fls) tru

-- ***********************************************************************************











