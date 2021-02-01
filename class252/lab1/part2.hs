-- Do the game fizzbuzz (http://en.wikipedia.org/wiki/Fizz_buzz).
-- Return a string counting from 1 to the specified number.
-- Replace numbers dvisible by 3 with "fizz" and numbers divisible
-- by 5 with "buzz".  If a number is divisible by both 3 and 5,
-- replace it with "fizzbuzz".

fizzbuzz :: Int -> String
fizzbuzz 0 = error "Non-negative numbers only"
fizzbuzz x 
  | (x `mod` 3 == 0) && (x `mod` 5 == 0) = "fizzbuzz"
  | x `mod` 3 == 0 = "fizz"
  | x `mod` 5 == 0 = "buzz"
  | otherwise = "test"


main :: IO ()
main = do
  print (fizzbuzz 5)
  -- print (fizzbuzz 7)
  -- print $ fizzbuzz 99
  -- print $ fizzbuzz 0