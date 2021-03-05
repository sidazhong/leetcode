-- For all exercises listed here, use fmap
convertStringList2NumList :: [String] -> [Integer]
convertStringList2NumList = fmap read

addOne2List :: [Int] -> [Int]
addOne2List = fmap(\x -> x+1)

-- If there is a number, increment its value.
-- Your solution should be one line long.
maybeIncrement :: Maybe Int -> Maybe Int
maybeIncrement = fmap(\x -> x+1)


-- This version should replace maybeIncrement and addOne2List both
incrementContents :: Functor f => f Int -> f Int
incrementContents = fmap(\x -> x+1)


main :: IO ()
main = do
  print $ convertStringList2NumList ["1", "2", "3"]
  print $ convertStringList2NumList []
  print $ convertStringList2NumList ["42", "12"]
  
  print $ maybeIncrement Nothing
  print $ maybeIncrement $ Just 1
  print $ maybeIncrement $ Just 99
  
  print $ incrementContents $ Nothing
  print $ incrementContents $ Just 42
  print $ incrementContents $ [3, 2, 99]
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  