import Interp

testUnit :: IO ()
testUnit = do
  -- 1
  putStrLn $ show $ Interp.run (Num 1)
  -- 42
  putStrLn $ show $ Interp.run (Num 42)
  -- crash
  putStrLn $ show $ Interp.run Crash
  -- read x
  putStrLn $ show $ Interp.run (Read "x") -- Note that x is not in the store
  -- set x 9
  putStrLn $ show $ Interp.run (Set "x" (Num 9))
  -- inc 9
  putStrLn $ show $ Interp.run (Inc (Num 9))
  -- test 9 8
  putStrLn $ show $ Interp.run (Test (Num 9) (Num 8))
  -- test 9 9
  putStrLn $ show $ Interp.run (Test (Num 9) (Num 9))
  -- 1 then 2
  putStrLn $ show $ Interp.run (Then (Num 1) (Num 2))
  -- set x 42 then read x
  putStrLn $ show $ Interp.run (Then (Set "x" (Num 42)) (Read "x"))
  -- crash then set x 1 then read x
  putStrLn $ show $ Interp.run (Then Crash (Then (Set "x" (Num 1)) (Read "x")))
  -- loop (test 9 8) crash
  putStrLn $ show $ Interp.run (Loop (Test (Num 9) (Num 8)) Crash)
  -- loop (test 9 9) crash
  putStrLn $ show $ Interp.run (Loop (Test (Num 9) (Num 9)) Crash)
  -- loop (test (read x) 9) (set x (read x))
  putStrLn $ show $ Interp.run (Loop (Test (Read "x") (Num 9)) (Set "x" (Inc (Read "x"))))
  -- set x 0 then loop (test (read x) 9) (set x (read x))
  putStrLn $ show $ Interp.run (Then (Set "x" (Num 0)) (Loop (Test (Read "x") (Num 9)) (Set "x" (Inc (Read "x")))))

main :: IO ()
main = do
  testUnit





























