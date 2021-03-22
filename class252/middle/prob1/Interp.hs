{-
  Name: Sida Zhong
  Class: CS 252
  Description: CS 252, Spring 2021, Take home exam, problem #1.
-}


module Interp (
  Expression(..),
  testProgram,
  run
) where

import Data.Map (Map)
import qualified Data.Map as Map

-- We represent variables as strings.
type Variable = String

-- The store is an associative map from variables to values.
-- (The store roughly corresponds with the heap in a language like Java).
type Store = Map Variable Integer

data Expression =
    Num Integer                     -- n
  | Set Variable Expression         -- set x e
  | Read Variable                   -- read x
  | Loop Expression Expression      -- loop e1 e2
  | Inc Expression                  -- inc e
  | Test Expression Expression      -- test e1 e2
  | Then Expression Expression      -- e1 then e2
  | Crash
  deriving (Show)


-- Implement this function according to the specified semantics
evaluate :: Expression -> Store -> Maybe (Integer, Store)
evaluate (Num n) s = Just (n, s)
evaluate Crash _ = Nothing


-- ==========================================================================================
-- evaluate _ _ = error "TBD"
evaluate (Read x) s = 
  case (Map.lookup x s) of
    Just i -> Just (i,s)
    _      -> Nothing
    
evaluate (Set x e1) s = 
  let Just (v1,s1) = evaluate e1 s
  in case () of 
    _ | (evaluate e1 s == Nothing) -> Nothing
      | otherwise -> Just (v1, (Map.insert x v1 s1))  
  
evaluate (Inc e1) s = 
  let Just (v1,s1) = evaluate e1 s
  in case () of 
    _ | (evaluate e1 s == Nothing) -> Nothing
      | otherwise -> Just (v1+1,s1)
  
evaluate (Test e1 e2) s =
  let Just (v1,s1) = evaluate e1 s
      Just (v2,s2) = evaluate e2 s1
  in case () of 
    _ | (evaluate e1 s == Nothing) -> Nothing
      | (evaluate e2 s1 == Nothing) -> Nothing
      | (v1 /= v2) -> Just (0,s2)
      | (v1 == v2) -> Just (1,s2)


evaluate (Then e1 e2) s =
  let Just (v1,s1) =  evaluate e1 s
      Just (v2,s2) =  evaluate e2 s1
  in case () of 
    _ | (evaluate e1 s == Nothing) -> Nothing
      | (evaluate e2 s1 == Nothing) -> Nothing
      | otherwise -> Just (v2,s2)


evaluate (Loop e1 e2) s = 
  let Just (v1,s1) = evaluate e1 s
      Just (v2,s2) = evaluate e2 s1   
      Just (v3,s3) = evaluate (Loop e1 e2) s2
  in case () of 
     _ | (evaluate e1 s == Nothing) -> Nothing
       | (evaluate e1 s == Just (1,s)) -> Just (1,s1)
       | (evaluate e2 s1 == Nothing) -> Nothing
       | (evaluate e1 s == Just (0,s)) -> Just (v2,s2)
       | otherwise -> Just (v3,s3)

-- ==========================================================================================

-- Evaluates a program with an initially empty state
run :: Expression -> Maybe (Integer, Store)
run prog = evaluate prog Map.empty

-- The same as run, but only returns the Store
testProgram :: Expression -> Maybe Store
testProgram prog = case run prog of
  Nothing -> Nothing
  Just (_, s) -> Just s











































