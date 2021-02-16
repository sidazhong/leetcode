data Exp = ETrue
     | EFalse
     | Eif Exp Exp Exp
  deriving Show

data Val = VTrue
     | VFalse
     | VInt Int
  deriving (Show,Eq)

evaluate :: Exp -> Val
evaluate ETrue = VTrue
evaluate EFalse = VFalse


-- e1 => true   e2 => v
-- e1 => false  e3 => v
evaluate (Eif e1 e2 e3)
  | evaluate e1 == VTrue = evaluate e2
  | evaluate e1 == VFalse = evaluate e3





prog1 = Eif ETrue ETrue EFalse

main :: IO ()
main = do
  putStrLn $ "Evaluating '" ++ (show prog1) ++ "' results in " ++ (show $ evaluate prog1)
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

