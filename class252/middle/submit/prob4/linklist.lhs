> import Control.Applicative

This problem works with functors, applicative functors, and monads.
We will use linked lists for our examples.  (Conceptually, our
implementations will match the implementaions for Haskell Lists; if
you are stuck, you might consider reviewing those from the class slides).

> data LinkList a = Node a (LinkList a) | End deriving (Show)

First, define the Functor implementation for linked lists, so that
fmap will apply the function to the content of every node in the
list.

> instance Functor LinkList where
>   fmap f End = End
>   fmap f (Node v l) = Node (f v) (fmap f l) 

Two test cases are given below for your consideration.

> testFmap1 =
>   let lst = Node 1 (Node 2 (Node 3 End))
>   in fmap (+1) lst
>
> testFmap2 =
>   let lst = Node 1 (Node 2 (Node 3 End))
>   in fmap (\v -> v*v) lst



Next, add support for applicative functors.  The function below
concatenates two linked lists into a new linked list, which might
be usefule for your solution.

> joinList :: LinkList a -> LinkList a -> LinkList a
> joinList End lst = lst
> joinList (Node v rest) lst = Node v (joinList rest lst)


For your applicative functor implementation, you must implement
both 'pure' and '<*>'.  The 'pure' function should put the value
into a list of one element (similar to the applicative functor
implementation for lists).

For the '<*>' operator, apply every function in the left list
to every value in the right list, concatenating the results.
Again, this design mirrors the applicative functor behavior of
Haskell lists.

> instance Applicative LinkList where
>   pure v = Node v End
>   _ <*> _ = error "TBD"

A test case is provided for you below:

> testAppFun1 =
>   let funLst = Node (+1) (Node (+2) (Node (+3) End))
>       valLst = Node 8 (Node (100) End)
>   in funLst <*> valLst


Finally, implement the monadic behavior for linked lists.
The behavior or 'return' is identical to 'pure'.  The 'fail'
function should return 'End', ignoring the message.

Implementing bind (>>=) is the most complex part.  The function
should be applied to the contents of the nodes, and should
return a linked list.  (Unlike fmap, the final list might not be
the same size).

As with the previous examples, this behavior should match the monadic
implementation of Haskell lists.

> instance Monad LinkList where
>   return v = error "TBD"
>   _ >>= _ = error "TBD"
>   fail _ = error "TBD"

Two test cases are provided for you below.

The testMonad1 case should give an equivalent result to calling:

  [1,2,3] >>= (\v -> [(v+1)]) >>= (\v -> [v*v])

except of course that your result will be a linked list.

> testMonad1 =
>   let lst = Node 1 (Node 2 (Node 3 End))
>   in lst >>= (\v -> return (v+1)) >>= (\v -> return (v*v))

The second test case is equivalent to calling:

   [1,2,3] >>= (\v -> [(v+1), (v-1)])

> testMonad2 =
>   let lst = Node 1 (Node 2 (Node 3 End))
>   in lst >>= (\v -> Node (v+1) (Node (v-1) End))


The main method calls and prints all test cases.

> main = do
>   print $ testFmap1
>   print $ testFmap2
>   print $ testAppFun1
>   print $ testMonad1
>   print $ testMonad2


