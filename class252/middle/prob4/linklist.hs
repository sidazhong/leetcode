import Control.Applicative

data LinkList a = Node a (LinkList a) | End deriving (Show)

instance Functor LinkList where
  fmap f End = End
  fmap f (Node v l) = Node (f v) (fmap f l) 

testFmap1 =
  let lst = Node 1 (Node 2 (Node 3 End))
  in fmap (+1) lst

testFmap2 =
  let lst = Node 1 (Node 2 (Node 3 End))
  in fmap (\v -> v*v) lst
  
  
-- ===================================================================================

joinList :: LinkList a -> LinkList a -> LinkList a
joinList End lst = lst
joinList (Node v rest) lst = Node v (joinList rest lst)


instance Applicative LinkList where
  pure v = Node v End
  fs <*> xs = error "TBD"
  -- (Node left right f) <*> (Node left' right' v) = (Node (left <*> left') (right <*> right') (f v))
  (Node f l) <*> (Node v l') = Node (joinList (l l') (f v)  )

testAppFun1 =
  let funLst = Node (+1) (Node (+2) (Node (+3) End))
      valLst = Node 8 (Node (100) End)
  in funLst <*> valLst
-- ===================================================================================

instance Monad LinkList where
  return v = pure v
  _ >>= _ = error "TBD"
  fail _ = End

testMonad1 =
  let lst = Node 1 (Node 2 (Node 3 End))
  in lst >>= (\v -> return (v+1)) >>= (\v -> return (v*v))


testMonad2 =
  let lst = Node 1 (Node 2 (Node 3 End))
  in lst >>= (\v -> Node (v+1) (Node (v-1) End))



main = do
  {-
  print $ testFmap1
  print $ testFmap2
  -- print $ testAppFun1
  -}
  print $ testMonad1
  {-
  print $ testMonad2
  -}

















