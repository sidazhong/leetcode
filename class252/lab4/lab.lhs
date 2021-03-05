> import Data.List

Experiment with foldl, foldr, and foldl'

First, implement your own version of the foldl function,
defined as myFoldl

> myFoldl :: (a -> b -> a) -> a -> [b] -> a
> myFoldl _ _ _ = error "TBD"


Next, define a function to reverse a list using foldl.

> myReverse :: [a] -> [a]
> myReverse _ = error "TBD"


Now define your own version of foldr, named myFoldr

> myFoldr :: (a -> b -> b) -> b -> [a] -> b
> myFoldr _ _ _ = error "TBD"


Now try using foldl (the library version, not yours) to sum up the numbers of a large list.
Why is it so slow?

Instead of foldl, try using foldl'.
Why is it faster?
(Read http://www.haskell.org/haskellwiki/Foldr_Foldl_Foldl%27 for some hints)


For an extra challenge, try to implement foldl in terms of foldr.
See http://www.haskell.org/haskellwiki/Foldl_as_foldr for details.


Next, using the map function, convert every item in a list to its absolute value

> listAbs :: [Integer] -> [Integer]
> listAbs _ = error "TBD"

Finally, write a function that takes a list of Integers and returns the sum of
their absolute values.

> sumAbs :: [Integer] -> Integer
> sumAbs _ = error "TBD"









lab4
1. 

--   :t f 
--   f :: [a] -> a -> [a]  
--   f :: c -> d -> c

(\x y -> y:x) [] 1    # [1]
The lambda expression.  ->  put 1 into an [].

2. 
foldl (\x y -> y:x) [] [1,2,3]   # [3,2,1]  
The foldl, -> put each elements of [1,2,3] into an []

3.
myReversel :: [a] -> [a]
myReversel x = foldl (\x y -> y:x) [] x 
a function, -> just pass any array x to foldl. otherwise exactly the same as step2.

4.
-- a is list (not nessary)
-- 
myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl _ base [] = base
myFoldl f base (x:xs) = myFoldl f (f base x) xs
This is from the lecture. 


-- foldl (+) (1 + 2 + 3 + 0) [] 
-- 1 + 2 + 3 + 0 
-- 6 
-- (+) 2 3    
-- f 2 3





:=  assignment
	x=x+1
	x := x +1 

;   sequence
	e1;e2 
	e1 x := x+1
	e2 x := x+2
	 --x=3
	
σ   store
	σ = e2
	e1;e2 
	











































