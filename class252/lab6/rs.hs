import Control.Applicative


data Tree a = Node (Tree a) (Tree a) a
            | Empty
  deriving (Show, Eq)

leaf = Node Empty Empty

instance Functor Tree where
    fmap f Empty = Empty
    fmap f (Node left right v) =   Node (fmap f left) (fmap f right) (f v)


test1 = fmap (+1) $ Node (leaf 3) (leaf 7) 5

pure = leaf
Empty <*> _ = Empty
_ <*> Empty = Empty
(Node left right f) <*> (Node left' right' v) = (Node (left <*> left') (right <*> right') (f v))


testapp1 = (Node (leaf (+1)) (leaf (+2)) (+7)) <*> (Node (leaf 1) (leaf 8) 3)

listNums = Node (Node (leaf (1)) (leaf (2)) (7)) (Node (leaf 1) (leaf 8) 3) 42
testapp2 = (*) <$> listNums <*> listNums


foo box = do
  v <- box
  return (v+1)


