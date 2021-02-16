data Exp = ETrue
     | EFalse
     | Eif Exp Exp Exp
     | EInt Int
     | EPred Exp
     | ESucc Exp
  deriving Show

data Val = VTrue
     | VFalse
     | VInt Int
  deriving (Show, Eq)

evaluate :: Exp -> Val
evaluate ETrue = VTrue
evaluate EFalse = VFalse

evaluate (EInt intVal) = VInt intVal
evaluate (Eif cond expTrue expFalse) = 
    if (condValue == VTrue)
      then (evaluate expTrue)
    else if (condValue == VFalse)
      then (evaluate expFalse)
    else error "Invalid expression"
    where condValue = evaluate cond
evaluate (ESucc expS) = case (evaluate expS) of
    VInt a -> VInt (a+1)
    _ -> error "Invalid"
evaluate (EPred expS) = case (evaluate expS) of
    VInt a -> VInt (a-1)
    _ -> error "Invalid"

prog1 = Eif ETrue ETrue EFalse
prog2 = Eif (Eif ETrue EFalse ETrue) ETrue (Eif ETrue EFalse ETrue)
prog3 = ESucc (ESucc (EInt 100))
prog4 = EPred (EPred (EInt 100))

main :: IO ()
main = do
  putStrLn $ "Evaluating '" ++ (show prog1) ++ "' results in " ++ (show $ evaluate prog1)
  putStrLn $ "Evaluating '" ++ (show prog2) ++ "' results in " ++ (show $ evaluate prog2)
  putStrLn $ "Evaluating '" ++ (show prog3) ++ "' results in " ++ (show $ evaluate prog3)
  putStrLn $ "Evaluating '" ++ (show prog4) ++ "' results in " ++ (show $ evaluate prog4)



















