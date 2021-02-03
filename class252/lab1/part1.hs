http://codecheck.it/files/1801270115e7z5z5wxbxeqdep0nhqg29hic

maxNum :: [Integer] -> Integer
maxNum [] = error "empty list" 
maxNum [x] = x
maxNum (x:xs) 
    | x > maxNumber = x  
    | otherwise = maxNumber 
    where 
      maxNumber = maxNum xs 
      
      

maxNum [] = error "Not implemented"
maxNum [x] = x
maxNum (x:xs) = 
  if x > maxNumber
    then x
  else 
    maxNumber
  where 
    maxNumber = maxNum xs
      

      
maxNum :: [Integer] -> Integer
maxNum [] = error "Not implemented"
maxNum [x] = x
maxNum (x:xs) = maxNum ([y | y <- xs, y > x]++[x])




main :: IO ()
main = do
  print (maxNum [1,2,3])
  print (maxNum [4])
  print $ maxNum [7, 12, 0, 99, 46, 12349, 82] -- note the use of the '$' here
  print $ maxNum [-4, -1, -99, -2]
  print $ maxNum [7, -9, 12, 0, 99, -3, 46, 12349, 82, -7, 8]
  print $ maxNum []
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  