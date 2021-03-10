data Binop =
    Plus     -- +  :: Int  -> Int  -> Int
  | Minus    -- -  :: Int  -> Int  -> Int
  | Times    -- *  :: Int  -> Int  -> Int
  | Divide   -- /  :: Int  -> Int  -> Int
  deriving (Show)

applyOp :: Binop -> Maybe Int -> Maybe Int -> Maybe Int
applyOp Plus mi mj =
  case mi of
    Nothing -> Nothing
    Just i ->
      case mj of
        Nothing -> Nothing
        Just j -> Just $ i + j
applyOp Minus mi mj =
  mi >>= (\i -> 
  mj >>= (\j -> 
  Just $ i - j))
applyOp Times mi mj = 
  mi >>= (\i -> 
  mj >>= (\j -> 
  Just $ i * j))
applyOp Divide mi mj = 
  mi >>= (\i -> 
  mj >>= (\j -> 
  if j > 0 then
    Just $ i `div` j
    else fail "div by 0"))

testapp1 = applyOp Minus (applyOp Times (Just 3) (Just 4)) $ applyOp Divide (Just 8) (Just 2)
testapp2 = applyOp Minus (applyOp Times (Just 3) (Just 4)) $ applyOp Divide (Just 8) (applyOp Plus (Just 3) (Just (-3)))


applyOp' :: Binop -> Maybe Int -> Maybe Int -> Maybe Int
applyOp' Plus mi mj = do
  i <- mi
  j <- mj
  return $ i + j
applyOp' Minus mi mj = do
  i <- mi
  j <- mj
  return $ i - j
applyOp' Times mi mj = do
  i <- mi
  j <- mj
  return $ i * j
applyOp' Divide mi mj = do
  i <- mi
  j <- mj
  return $ i `div` j

testapp1' = applyOp' Minus (applyOp' Times (Just 3) (Just 4)) $ applyOp' Divide (Just 8) (Just 2)
testapp2' = applyOp' Minus (applyOp' Times (Just 3) (Just 4)) $ applyOp' Divide (Just 8) (applyOp' Plus (Just 3) (Just (-3)))




mincr :: Int -> Maybe Int
mincr i = Just $ i + 1

mdecr :: Int -> Maybe Int
mdecr i = Just $ i - 1


testIncDec = Just 7 >>= mincr >>= mincr >>= mincr >>= mdecr


main :: IO ()
main = do
  putStrLn $ show testapp1
  putStrLn $ show testapp2
  putStrLn $ show testapp1'
  --putStrLn $ show testapp2'
  putStrLn $ show testIncDec

-- Does bind seem more natural in this case than using do?  Why or why not?
-- Yes bind looks more friendly in this case, because there is no exception to worry about.

































