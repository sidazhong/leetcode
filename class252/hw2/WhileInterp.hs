{-
  Name: Sida Zhong
  Class: CS 252
  Assigment: HW2
  Date: Mar 13 by 11:59pm
  Description: <Describe the program and what it does>
-}


module WhileInterp (
  Expression(..),
  Binop(..),
  Value(..),
  testProgram,
  run
) where

import Data.Map (Map)
import qualified Data.Map as Map

-- We represent variables as strings.
type Variable = String

-- The store is an associative map from variables to values.
-- (The store roughly corresponds with the heap in a language like Java).
type Store = Map Variable Value

data Expression =
    Var Variable                            -- x
  | Val Value                               -- v
  | Assign Variable Expression              -- x := e
  | Sequence Expression Expression          -- e1; e2
  | Op Binop Expression Expression          -- e1 o e2
  | If Expression Expression Expression     -- if e1 then e2 else e3
  | While Expression Expression             -- while (e1) e2
  | AND Expression Expression               -- e1 AND e2
  | OR Expression Expression                -- e1 OR e2
  | NOT Expression                          -- NOT e
  deriving (Show)

data Binop =
    Plus     -- +  :: Int  -> Int  -> Int
  | Minus    -- -  :: Int  -> Int  -> Int
  | Times    -- *  :: Int  -> Int  -> Int
  | Divide   -- /  :: Int  -> Int  -> Int
  | Gt       -- >  :: Int -> Int -> Bool
  | Ge       -- >= :: Int -> Int -> Bool
  | Lt       -- <  :: Int -> Int -> Bool
  | Le       -- <= :: Int -> Int -> Bool
  deriving (Show)

data Value =
    IntVal Int
  | BoolVal Bool
  deriving (Show,Eq)

-- This function will be useful for defining binary operations.
-- The first case is done for you.
-- Be sure to explicitly check for a divide by 0 and throw an error.

applyOp :: Binop -> Value -> Value -> Value
applyOp Plus (IntVal i) (IntVal j) = IntVal $ i + j
applyOp Minus (IntVal i) (IntVal j) = IntVal $ i - j
applyOp Times (IntVal i) (IntVal j) = IntVal $ i * j
applyOp Divide (IntVal i) (IntVal 0) = error "Can not be devied by zero " --Be sure to explicitly check for a divide by 0 and throw an error.
applyOp Divide (IntVal i) (IntVal j) = IntVal $ i `div` j
applyOp Gt (IntVal i) (IntVal j) = BoolVal $ i > j
applyOp Ge (IntVal i) (IntVal j) = BoolVal $ i >= j
applyOp Lt (IntVal i) (IntVal j) = BoolVal $ i < j
applyOp Le (IntVal i) (IntVal j) = BoolVal $ i <= j
applyOp _ _ _ = error "TBD"


-- Implement this function according to the specified semantics
evaluate :: Expression -> Store -> (Value, Store)



-- 02/22/2021 
-- https://sjsu.zoom.us/rec/play/FnQn3OuezDc92vr6w0pu-v93oao_c6NUfDmYNm7ZkUK_gZs1XzVDMsm3JjcK3huGoefwh5aeMGAZRdEs.RiNxtTpGxG91OkjH?continueMode=true&_x_zm_rtaid=dg34ASLEQMKs5tidkbLPGA.1615067678154.e4edb91e5eec235f6e5d9eb6b14516b3&_x_zm_rhtaid=214
-- pn7B?kQB
-- =============================================================================
-- [ss-val]  -- 44:08
-- (Val (IntVal 1))  -- (IntVal 1,fromList [])
-- v1 -> v1
evaluate (Val v) s = (v, s) 

-- =============================================================================
-- [ss-assign] -- 44:30
-- (Assign "X" (Val (BoolVal True))) -- (BoolVal True,fromList [("X",BoolVal True)])
-- e,s -> e',s'
-- x := e,s -> x:= e',s'
-- x := v, s → v, s[x := v]
-- evaluate (Assign x (Val v)) s = (v, (Map.insert x v s))
-- Assign Variable Expression -- s1 = Map.insert "a" 42 s
evaluate (Assign x e1) s = 
  let (v1,s1) = evaluate e1 s
  in (v1, (Map.insert x v1 s1))


-- ============================================================================= 
-- [ss-seq] -- 39:02
-- (Sequence (Val (IntVal 1)) (Val (IntVal 2))) -- (IntVal 2,fromList [])
-- e1,s -> e1,s'
-- e1;e2,s -> e1':e2,s'
-- v;e,s -> e,s
-- evaluate (Sequence (Val v) e) s = evaluate e s
-- Sequence Expression Expression 
evaluate (Sequence e1 e2) s =
  let (v1,s1) =  evaluate e1 s
      (v2,s2) =  evaluate e2 s1
  in (v2, s2)
  

-- =============================================================================  
-- [ss-op] -- 42:24
-- (Op Plus (Val (IntVal 9)) (Val (IntVal 2))) -- (IntVal 11,fromList [])

-- e1,s -> e1,s'
-- e1 op e2,s -> e1' op e2,s'

-- e,s -> e',s'
-- v op e,s -> v op e',s'

-- v = v1 op v2
-- v1 op v2,s -> v,s
-- evaluate (Op o (Val v1) (Val v2)) s = (applyOp o v1 v2, s)
-- Op Binop Expression Expression 
evaluate (Op o e1 e2) s =
  let (v1,s1) = evaluate e1 s
      (v2,s2) = evaluate e2 s1
  in (applyOp o v1 v2, s2)


-- =============================================================================
-- [bs-if] -- 22:13
-- (If (Val (BoolVal True)) (Val (IntVal 1)) (Val (IntVal 2))) -- (IntVal 1,fromList [])
-- (If (Val (BoolVal True)) (Val (IntVal 1)) (Val (IntVal 2))) -- (IntVal 2,fromList [])
-- if true then e1 else e2, s -> e1,s 
-- if false then e1 else e2,s -> e2,s
-- evaluate (If (Val (BoolVal True)) e1 e2) s = evaluate e1 s
-- evaluate (If (Val (BoolVal False)) e1 e2) s = evaluate e2 s
-- If Expression Expression Expression
evaluate (If e1 e2 e3) s 
  | evaluate e1 s == (BoolVal True,s) = evaluate e2 s
  | evaluate e1 s == (BoolVal False,s) = evaluate e3 s
  
  


-- =============================================================================
-- [ss-while] -- 55:47
-- (While (Val (BoolVal False)) (Val (IntVal 42))) -- (BoolVal False,fromList [])
-- while (e1) e2, s -> if e1 then e2 ; while (e1) e2 else false, s
{-
evaluate (While e1 e2) s = evaluate (
  If e1 
    (Sequence e2 (While e1 e2)) 
    (Val (BoolVal False))) s

evaluate (While e1 e2) s 
  | evaluate e1 s == (BoolVal True,s) = evaluate (Sequence e2 (While e1 e2)) s
  | evaluate e1 s == (BoolVal False,s) = (BoolVal False,s)
-}

{-
evaluate (While e1 e2) s 
  | evaluate e1 s == (BoolVal True,s) = (v1, s1)
  | evaluate e1 s == (BoolVal False,s) = (BoolVal False,s)
  where 
    (v1,s1) = evaluate (Sequence e2 (While e1 e2)) s
-}

evaluate (While e1 e2) s 
  | evaluate e1 s == (BoolVal True,s) = (v1, s1)
  | evaluate e1 s == (BoolVal False,s) = (BoolVal False,s)
  where 
    (v1,s1) = evaluate (While e1 e2) s2
    (v2,s2) = evaluate e2 s
  
-- =============================================================================
-- (Sequence (Assign "X" (Val (IntVal 666))) (Var "X")) -- (IntVal 666,fromList [("X",IntVal 666)])
-- main = do
--   case (Map.lookup "a" m') of
--     Just i -> putStrLn $ show i
--     _      -> error "Key is not in the map"
evaluate (Var v) s = 
  case (Map.lookup v s) of
    Just i -> (i,s)
    _      -> error "Key is not in the map"

{-
[BS-WhileFalse] 
e1, sigma ->* false, sigma’ 
------- 
while(e1) e2, sigma ->* false sigma’ 
[BS-WhileTrue] 
e1, sigma ->* true, sigma1 
e2, sigma1 ->* v, sigma2 
while(e1) e2, sigma2 ->* v’, sigma’ 
——— 
while(e1) e2), sigma ->* v’, sigma’ 



w_test = 
	(Sequence 
		(Assign "X" 
			(Op Plus 
				(Op Minus 
					(Op Plus 
						(Val (IntVal 1)) 
						(Val (IntVal 2))
					) 
					(Val (IntVal 3))
				) 
				(Op Plus 
					(Val (IntVal 1)) 
					(Val (IntVal 3))
				)
			)
		) 
		(Sequence 
			(Assign "Y" 
				(Val (IntVal 0))
			) 
			(While 
				(Op Gt (Var "X") (Val (IntVal 0))		-------------------
			) 
			(Sequence (Assign "Y" (Op Plus (Var "Y") (Var "X"))) 
			
			(Assign "X" (Op Minus (Var "X") (Val (IntVal 1))))))))
-}

-- =============================================================================


evaluate (AND e1 e2) s 
  | evaluate e1 s == (BoolVal False,s) = (BoolVal False,s)
  | evaluate e2 s == (BoolVal False,s) = (BoolVal False,s)
  | evaluate (OR e1 e2) s == (BoolVal True,s) = (BoolVal True,s)
  {-
  | evaluate (OR e1 e2) s == (BoolVal False,s) = (BoolVal False,s)
  | evaluate e1 s == (BoolVal True,s) = (BoolVal True,s)
  | evaluate e2 s == (BoolVal True,s) = (BoolVal True,s)
  -}

-- =============================================================================
evaluate (OR e1 e2) s 
  | evaluate e1 s == (BoolVal True,s) = (BoolVal True,s)
  | evaluate e2 s == (BoolVal True,s) = (BoolVal True,s)
  | evaluate (AND e1 e2) s == (BoolVal False,s) = (BoolVal False,s)
  {-
  | evaluate (AND e1 e2) s == (BoolVal False,s) = (BoolVal False,s)
  | evaluate e1 s == (BoolVal True,s) = (BoolVal True,s)
  | evaluate e2 s == (BoolVal True,s) = (BoolVal True,s)
  -}
  
-- =============================================================================
evaluate (NOT e1) s 
  | evaluate e1 s == (BoolVal True,s) = (BoolVal False,s)
  | evaluate e1 s == (BoolVal False,s) = (BoolVal True,s)











-- Evaluates a program with an initially empty state
run :: Expression -> (Value, Store)
run prog = evaluate prog Map.empty

-- The same as run, but only returns the Store
testProgram :: Expression -> Store
testProgram prog = snd $ run prog













