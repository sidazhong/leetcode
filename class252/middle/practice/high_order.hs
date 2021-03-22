import Data.List

add :: Integer -> Integer
add x = x + 1

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x:xs) = f x : myMap f (xs)

myFoldLeft :: (a -> b -> a) -> a -> [b] -> a
myFoldLeft _ base [] = base
myFoldLeft f base (x:xs) = myFoldLeft f (f base x) xs


makeListOfAdders :: [Integer] -> Integer -> [Integer]
makeListOfAdders [] x = []
makeListOfAdders (x:xs) num = x + num : makeListOfAdders xs num


adders = makeListOfAdders [1,2]


main :: IO ()
main = do
  print $ myMap (+1) [1,2]
  print $ myFoldLeft (+) 0 [1,3,5]
  print $ head (adders 10)
  print $ head (tail (adders 10))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
