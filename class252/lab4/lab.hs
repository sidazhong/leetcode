import Data.List



myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl _ base [] = base
myFoldl f base (x:xs) = myFoldl f (f base x) xs

--(\x y -> y:x) [] 1
--foldl (\x y -> y:x) [] [1,2,3]
myReversel :: [a] -> [a]
myReversel x = myFoldl (\x y -> y:x) [] x





myFoldr :: (a -> b -> b) -> b -> [a] -> b
myFoldr _ base [] = base
myFoldr f base (x:xs) = f x (myFoldr f base xs)

--foldr (\x y -> y ++ [x]) [] [1,2,3]
myReverser :: [a] -> [a]
myReverser x = myFoldr (\x y -> y ++ [x]) [] x

--myReverse :: [a] -> [a]
--myReverse [] = []
--myReverse (x:xs) = myReverse xs ++ [x] 


absolute :: Integer -> Integer
absolute x = abs x

listAbs :: (Integer -> Integer) -> [Integer] -> [Integer]
listAbs _ [] = []
listAbs f (x:xs) = f x : listAbs f xs

sumAbs :: (Integer -> Integer) -> [Integer] -> Integer
sumAbs _ [] = 0
sumAbs f (x:xs) = f x + sumAbs f xs


main :: IO ()
main = do
  print $ myReversel [1,2,3,4,5]
  print $ myReverser [1,2,3,4,5]
  
  print $ listAbs absolute [1,-2,-3,4,5]
  print $ sumAbs absolute [1,-2,3,4,5]
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
