import Data.Map (Map)
import qualified Data.Map as Map

data Trie = Node Bool (Map Char Trie) 
            deriving (Show)

emptyTrie = Node False Map.empty


newTrie :: String -> Trie
newTrie "" = Node True Map.empty
newTrie (x:xs) = Node False (Map.singleton x (newTrie xs))


addString :: String -> Trie -> Trie
addString "" (Node _ children) = (Node True children)
addString (ch:rest) (Node a children) =
  case Map.lookup ch children of
    Just subTrie -> Node a $ Map.insert ch (addString rest subTrie) children
    Nothing -> Node a $ Map.insert ch (newTrie rest) children


x -: f = f x

myTrie = emptyTrie
  -: addString "to"
  -: addString "tea"
  -: addString "ted"
  -: addString "ten"
  -: addString "ten"
  -: addString "A"
  -: addString "in"
  -: addString "inn"
  -: addString "invest"


contains :: Trie -> String -> Bool
contains (Node a children) "" 
  | a == False = False
  | a == True = True
contains (Node a children) (ch:rest) = 
  case Map.lookup ch children of
    Just subTrie -> contains subTrie rest
    Nothing -> False


main = do
  --print myTrie
  print $ contains myTrie "te"
  print $ contains myTrie "tea"
  print $ contains myTrie "ted"
  print $ contains myTrie "ten"
  print $ contains myTrie "tent"
  print $ contains myTrie "tentacle"
  print $ contains myTrie "in"
  print $ contains myTrie "inn"
  print $ contains myTrie "invest"
  print $ contains myTrie "interest"
  print $ contains myTrie "q"
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

