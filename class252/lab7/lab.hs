-- http://learnyouahaskell.com/functors-applicative-functors-and-monoids

import Control.Applicative
import qualified Data.Set as Set


type Label = String
type View = Set.Set Label

data FacetedValue a = Raw a
                    | Facet Label (FacetedValue a) (FacetedValue a)

view :: View -> FacetedValue a -> a
view _ (Raw x) = x
view labels (Facet k auth unauth) =
    if Set.member k labels then
      view labels auth
    else
      view labels unauth

instance Functor FacetedValue where
  fmap f (Raw a) = Raw (f a)
  fmap f (Facet label fv1 fv2) = Facet label (fmap f (fv1)) (fmap f (fv2))  
  

testFmap = do
  let creditCard = Facet "visa" (Raw 4111111111111111) (Raw 0)
      ccPlusOne = fmap (+1) creditCard
  putStrLn "Credit card views:"
  print $ view (Set.fromList ["visa"]) ccPlusOne -- Should print 4111111111111112
  print $ view (Set.fromList ["mastercard"]) ccPlusOne -- Should print 1

-- main = testFmap


-- 16:45
instance Applicative FacetedValue where
  pure = Raw
  Raw f <*> v = famp f v
  Facet label fAuth fUath <*> fv = 
    let newAuth = fAuth <*> fv
        newUnauth = fUnauth <*> fv
    in  Facet label newAuth newUnauth
    
    
    
    
  
  {-
  instance Applicative Maybe where  
    pure = Just  
    Nothing <*> _ = Nothing  
    (Just f) <*> something = fmap f something  
  
  fv1 = Facet "Bank of America" (Raw 44) (Raw 0)
  fv2 = Facet "Wells Fargo" (Raw 122) (Raw 0)
  fv1 <*> fv2 = combinedBalance = (+) <$> bofaBalance <*> wellsFargoBalance
  -}

testApplicative = do
  let bofaBalance = Facet "Bank of America" (Raw 44) (Raw 0)
      wellsFargoBalance = Facet "Wells Fargo" (Raw 122) (Raw 0)
      combinedBalance = (+) <$> bofaBalance <*> wellsFargoBalance
  print $ view (Set.fromList []) combinedBalance -- Should print 0
  print $ view (Set.fromList ["Bank of America"]) combinedBalance -- Should print 44
  print $ view (Set.fromList ["Wells Fargo"]) combinedBalance -- Should print 122
  print $ view (Set.fromList ["Bank of America", "Wells Fargo"]) combinedBalance -- Should print 166


main = testApplicative































