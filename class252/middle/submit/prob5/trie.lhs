> import Data.Map (Map)
> import qualified Data.Map as Map

A trie is a useful data structure for looking up items when you know
the beginning of a sequence.  For instance, a trie of characters can
be used to support autocomplete.  (For simplicity, we will assume a
Trie of characters).

> data Trie = Node Bool (Map Char Trie) deriving (Show)

A trie contains an item if the sequence ends at a node that accepts
the sequence (represented by the Boolean value).

For convenience, we will define a 'emptyTrie'.

> emptyTrie = Node False Map.empty


The following method will create new Trie from a String.

> newTrie :: String -> Trie
> newTrie "" = Node True Map.empty
> newTrie (x:xs) = Node False (Map.singleton x (newTrie xs))


Once you have a Trie, you can add additional strings to it.

> addString :: String -> Trie -> Trie
> addString "" (Node _ children) = (Node True children)
> addString (ch:rest) (Node a children) =
>   case Map.lookup ch children of
>     Just subTrie -> Node a $ Map.insert ch (addString rest subTrie) children
>     Nothing -> Node a $ Map.insert ch (newTrie rest) children


The following function is convenient for chaining calls to addString.

> x -: f = f x

For our examples, we will use the following Trie.

> myTrie = emptyTrie
>   -: addString "to"
>   -: addString "tea"
>   -: addString "ted"
>   -: addString "ten"
>   -: addString "ten"
>   -: addString "A"
>   -: addString "in"
>   -: addString "inn"
>   -: addString "invest"


To see if a trie contains a string, we walk the trie from the root.
There are three base cases to consider:

1) There are no characters left in the string, and we are in an
  accepting state.  The contains function should return true.

2) There are no characters left in the string, and we are **not**
  in an accepting state.  The contains function should return false.

3) We are at a leaf of the trie, but there are still remaining
  characters in the string.  The contains function shoud return false.

Complete the implementation below.

> contains :: Trie -> String -> Bool
> contains (Node a children) ""
>   | a == False = False
>   | a == True = True
> contains (Node a children) (ch:rest) = 
>   case Map.lookup ch children of
>     Just subTrie -> contains subTrie rest
>     Nothing -> False


> main = do
>   print $ contains myTrie "te"
>   print $ contains myTrie "tea"
>   print $ contains myTrie "ted"
>   print $ contains myTrie "ten"
>   print $ contains myTrie "tent"
>   print $ contains myTrie "tentacle"
>   print $ contains myTrie "in"
>   print $ contains myTrie "inn"
>   print $ contains myTrie "invest"
>   print $ contains myTrie "interest"
>   print $ contains myTrie "q"







Node False (
	fromList [
		('A',Node True (fromList [])),
		
		('i',Node False (fromList [
			('n',Node True (fromList [
				('n',Node True (fromList [])),
				('v',Node False (fromList [
					('e',Node False (fromList [
						('s',Node False (fromList [
							('t',Node True (fromList []))
						]))
					]))
				]))
			]))
		])),
		
		('t',Node False (fromList [
			('e',Node False (fromList [
				('a',Node True (fromList [])),
				('d',Node True (fromList [])),
				('n',Node True (fromList []))
			])),
			('o',Node True (fromList []))
		]))
		
	])