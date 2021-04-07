-- http://codecheck.it/files/1801270120a4iwu1xmznyiyliwjqj9akxcl

---SOLUTION
-- A JSON library written in Haskell, adapted from an example
-- from "Real World Haskell".

-- Note that the module name must match the name of the file.
module JSON (
  JValue(..), --The (..) means that we are exporting the type and all of its constructors
  toString,
  isNull,
  jsonRightTriangles)
where

data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
  deriving (Eq, Ord, Show)


--The type annotation indicates that the function takes a JValue and returns a String
toString :: JValue      -> String
toString (JString s)    = "\"" ++ s ++ "\""
toString (JNumber n)    = show n
toString (JBool True)   = "true"
toString (JBool False)  = "false"
toString JNull          = "null"
toString (JArray lst)   = "[" ++ list2str lst ++ "]"



toString (JObject obj)  = "{" ++ obj2str obj ++ "}"

obj2str :: [(String, JValue)] -> String
obj2str [] = ""
obj2str (x:[]) = (fst x) ++ ":" ++ toString (snd x)
obj2str (x:xs) = (fst x) ++ ":" ++ toString (snd x) ++ "," ++ obj2str xs



list2str :: [JValue] -> String
list2str [] = ""
list2str (x:[]) = (toString x)
list2str (x:xs) = (toString x) ++ ",\n " ++ (list2str xs)



{-

testNested = JObject [
  ("name", JObject [("first",JString "Tyrion"), ("last",JString "Lannister")]),
  ("age", JNumber 32),
  ("siblings", JArray [
    JString "Jamie",
    JString "Cersei"]),
  ("pet", JNull)]


{name:{first:"Tyrion",last:"Lannister"},age:32.0,siblings:["Jamie",
 "Cersei"],pet:null}
-}









isNull JNull  = True
isNull _      = False

jsonRightTriangles = JArray [ JObject [("a",JNumber a), ("b",JNumber b), ("c",JNumber c)] |
  a<-[1..10],
  b<-[1..10],
  c<-[1..10],
  a^2 + b^2 == c^2]




import JSON

testNested = JObject [
  ("name", JObject [("first",JString "Tyrion"), ("last",JString "Lannister")]),
  ("age", JNumber 32),
  ("siblings", JArray [
    JString "Jamie",
    JString "Cersei"]),
  ("pet", JNull)]

main :: IO ()
main = let arr = JSON.jsonRightTriangles
  in do
    putStrLn $ JSON.toString arr
























