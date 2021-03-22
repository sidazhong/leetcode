myadd :: Maybe Int -> Maybe Int -> Maybe Int 
myadd x y =
  x >>= (\i ->
  y >>= (\j ->
  Just $ i + j))
  
mysub :: Maybe Int -> Maybe Int -> Maybe Int 
mysub x y =
  x >>= (\i ->
  y >>= (\j ->
  Just $ i - j))
  
mymul :: Maybe Int -> Maybe Int -> Maybe Int 
mymul x y =
  x >>= (\i ->
  y >>= (\j ->
  Just $ i * j))
  
mydiv :: Maybe Int -> Maybe Int -> Maybe Int 
mydiv x y =
  x >>= (\i ->
  y >>= (\j ->
  if j > 0 then
    Just $ i `div` j
    else Nothing)) 
   
foo ::  Maybe Int -> Maybe Int
foo x = do
  y <- mydiv (x (Just 60))
  z <- myadd ((Just 9) (Just 3))
  return $ myadd (x y)
  
test1 = Just 10 >>= mydiv (Just 5) >>= myadd (Just 4) >>= mysub (Just 2)
-- test2 = foo 120


mincr :: Int -> Maybe Int
mincr i = Just $ i + 1
mdecr :: Int -> Maybe Int
mdecr i = Just $ i - 1
test = Just 7 >>= mincr >>= mincr >>= mincr >>= mdecr

main :: IO ()
main = do
  putStrLn $ show test1
  -- putStrLn $ show test1
  -- putStrLn $ show test2


{-
x -: f = f x

myadd x y = y + x

mysub x y = y - x

mymul x y = y * x

mydiv d = (\n -> case d of
  0 -> error "div by zero" 
  d -> div n d)
  
  
-- Evaluates to 4
test1 = 10 -: mydiv 5 -: myadd 4 -: mysub 2
-- Error
test2 = 10 -: mydiv 5 -: myadd 4 -: mysub 2 -: mydiv 0 -: mymul 10


main :: IO ()
main = do
  putStrLn $ show test1
  putStrLn $ show test2
-}
  
  

























