maxNum :: [Integer] -> Integer
maxNum [] = error "empty list" 
maxNum [v] = v 
maxNum (x:xs) -- Divide the array into one element and the following array
    | x >= maxNumber = x  -- If the current first number is greater and equal than the last largest number, use the current number
    | x < maxNumber = maxNumber --  If the current first number is greater than the last largest number, use the the last largest number
    where 
      maxNumber = maxNum xs -- Recursively loop to find the largest number

main :: IO ()
main = do
  print (maxNum [1,2,3])
  print (maxNum [4])
  print $ maxNum [7, 12, 0, 99, 46, 12349, 82] -- note the use of the '$' here
  print $ maxNum [-4, -1, -99, -2]
  print $ maxNum [7, -9, 12, 0, 99, -3, 46, 12349, 82, -7, 8]
  print $ maxNum []
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  