data Exp = ETrue
         | EFalse
         | En Int
         | Eif Exp Exp Exp
         | Esucc Exp
         | Epred Exp
    deriving Show

data Val = VTrue
         | VFalse
         | Vn Int
    deriving (Show,Eq)

evaluate :: Exp -> Val

-- e1 => true 
evaluate ETrue = VTrue

-- e1 => false
evaluate EFalse = VFalse

-- e1 => true   e2 => v
-- e1 => false  e3 => v
evaluate (Eif e1 e2 e3) = case evaluate e1 of
  VTrue -> evaluate e2
  VFalse -> evaluate e3
-- evaluate (Eif e1 e2 e3)
  -- | evaluate e1 == VTrue = evaluate e2
  -- | evaluate e1 == VFalse = evaluate e3

-- e1 => n 
evaluate (En n) = Vn n  

-- e1 => n n'=n+1
evaluate (Esucc e1) = case evaluate e1 of
   Vn n -> Vn (n+1)

-- e1 => n n'=n+1
-- evaluate (Esucc e1) 
  -- | evaluate e1 == Vn n = Vn (n+1)
  -- where n = 100

-- e1 => n n'=n-1 
evaluate (Epred e1) = case evaluate e1 of
  Vn n -> Vn (n-1)

prog1 = Eif ETrue ETrue EFalse
prog2 = Eif (Eif ETrue EFalse ETrue) ETrue (Eif ETrue EFalse ETrue)
prog3 = Esucc (Esucc (En 100))
prog4 = Epred (Epred (En 100))

main :: IO ()
main = do
  putStrLn $ "Evaluating '" ++ (show prog1) ++ "' results in " ++ (show $ evaluate prog1)
  putStrLn $ "Evaluating '" ++ (show prog2) ++ "' results in " ++ (show $ evaluate prog2)
  putStrLn $ "Evaluating '" ++ (show prog3) ++ "' results in " ++ (show $ evaluate prog3)
  putStrLn $ "Evaluating '" ++ (show prog4) ++ "' results in " ++ (show $ evaluate prog4)
  
  
  
-- 怎么用gard 代替 case of
-- 怎么表达 n'=n+1 && n>0
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

