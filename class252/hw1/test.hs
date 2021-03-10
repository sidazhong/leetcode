import BigNum

main :: IO ()
main = do
  putStrLn "Addition"
  --999 + 456
  putStrLn $ show $ bigAdd [999] [456]
  --1999 + 1456
  putStrLn $ show $ bigAdd [999,1] [456,1]
  --681234999 + 456
  putStrLn $ show $ bigAdd [999,234,681] [456]
  --456 + 681234999
  putStrLn $ show $ bigAdd [456] [999,234,681]
  --681000999 + 456
  putStrLn $ show $ bigAdd [999,0,681] [456]

  putStrLn "Subtraction"
  --1000 - 1
  putStrLn $ show $ bigSubtract [0,1] [1]
  --9643291 - 8329
  putStrLn $ show $ bigSubtract [291,643,9] [329,8]
  --999999 - 999998
  putStrLn $ show $ bigSubtract [999,999] [998,999]
  --10009 - 10009
  putStrLn $ show $ bigSubtract [9,10] [9,10]

  ----Error cases
  --putStrLn $ show $ bigSubtract [987] [0,1]
  --putStrLn $ show $ bigSubtract [9] [456]
  --putStrLn $ show $ bigSubtract [9] [10]
  --putStrLn $ show $ bigSubtract [9,999,999,999] [10,999,999,999]

  putStrLn "Multiplication"
  --3 * 4
  putStrLn $ show $ bigMultiply [3] [4]
  --1987 * 0
  putStrLn $ show $ bigMultiply [987,1] [0]
  --3001074098 * 4
  putStrLn $ show $ bigMultiply [98,74,1,3] [4]
  --3001074098 * 493128456291
  putStrLn $ show $ bigMultiply [98,74,1,3] [291,456,128,493]

  putStrLn "Power Of"
  --2^8
  putStrLn $ show $ bigPowerOf [2] [8]
  --1832^0
  putStrLn $ show $ bigPowerOf [832,1] [0]

  putStrLn "Others"
  
  
  putStrLn $ show $ bigMultiply [3] [4]
  putStrLn $ show $ bigMultiply [98,74,1,3] [4]
  putStrLn $ show $ bigMultiply [500,1] [9]
  putStrLn $ show $ bigMultiply [999] [10]
  putStrLn $ show $ bigMultiply [500,1] [900]     --[0][350][1]
  putStrLn $ show $ bigMultiply [500,11] [900]    --[0][350][10] 
  -- putStrLn $ show $ bigMultiply [111,11] [100]
  -- putStrLn $ show $ bigMultiply [111,1] [111]
  -- putStrLn $ show $ bigMultiply [111,1] [111,1]
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
