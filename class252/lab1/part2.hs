http://codecheck.it/files/1801222202d5zry2pb674sm51n6sc7ajplp

-- Do the game fizzbuzz (http://en.wikipedia.org/wiki/Fizz_buzz).
-- Return a string counting from 1 to the specified number.
-- Replace numbers dvisible by 3 with "fizz" and numbers divisible
-- by 5 with "buzz".  If a number is divisible by both 3 and 5,
-- replace it with "fizzbuzz".

fizzbuzz :: Int -> String
fizzbuzz x 
  | x == 0 = ""
  | x == 1 = "1"
  | x < 0 = error "Non-negative numbers only"
  | (x `mod` 3 == 0) && (x `mod` 5 == 0) = fizzbuzz (x-1) ++ " " ++ "fizzbuzz"
  | x `mod` 3 == 0 = fizzbuzz (x-1) ++ " " ++ "fizz"
  | x `mod` 5 == 0 = fizzbuzz (x-1) ++ " " ++ "buzz"
  | otherwise = fizzbuzz (x-1) ++ " " ++ show x


fizzbuzz :: Int -> String
fizzbuzz 0 = error "Non-negative numbers only"
fizzbuzz 1 = "1"
fizzbuzz x = do
    if (x `mod` 3 == 0) && (x `mod` 5 == 0) then fizzbuzz (x-1) ++ " fizzbuzz"
    else if x `mod` 3 == 0 then fizzbuzz (x-1) ++ " fizz"
    else if x `mod` 5 == 0 then fizzbuzz (x-1) ++ " buzz"
    else fizzbuzz (x-1) ++ " " ++ show x



main :: IO ()
main = do
  print (fizzbuzz 5)
  -- print (fizzbuzz 7)
  -- print $ fizzbuzz 99
  -- print $ fizzbuzz 0