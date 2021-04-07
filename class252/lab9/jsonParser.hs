module JSON (
  JValue(..), --The (..) means that we are exporting the type and all of its constructors
  toString)
where

import Text.ParserCombinators.Parsec
import System.Environment

data JValue = JString String
            | JNumber Double
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
  deriving (Eq, Ord, Show)


-- =============================================================
jsonFile :: GenParser Char st JValue
jsonFile = do
  result <- jsonArr <|> jsonObject
  spaces
  eof
  return result

jsonElem :: GenParser Char st JValue
jsonElem = do
  spaces
  result <- jsonElem'
  spaces
  return result

jsonElem' = jsonArr
        <|> jsonString
        <|> jsonBool
        <|> jsonNull
        <|> jsonNumber
        <|> jsonObject
        <?> "json element"

jsonString :: GenParser Char st JValue
jsonString = jsonStringDQ <|> jsonStringSQ

jsonStringDQ = do
  char '"'
  s <- many $ noneOf "\"" -- crude.  does not allow double quotes within strings
  char '"'
  return $ JString s

jsonStringSQ = do
  char '\''
  s <- many $ noneOf "'" -- crude, same as above
  char '\''
  return $ JString s
  
jsonBool = do
  bStr <- string "true" <|> string "false"
  return $ case bStr of
    "true" -> JBool True
    "false" -> JBool False

jsonNull = do
  string "null"
  return JNull

jsonArr = do
  char '['
  arr <- jsonElem `sepBy` (char ',')
  char ']'
  return $ JArray arr




-- 03/10 23:19
-- ==================================================================
jsonNumber :: GenParser Char st JValue
jsonNumber = do
  str <- many1 digit
  return $ JNumber (read str)  
-- ==================================================================
{-
  nums: [
    { real: 42, imaginary: 1 },
    { real: 30, imaginary: 0 },
    { real: 15, imaginary: 7 }
  ],
-}

-- { real: 42, imaginary: 1 }
jsonObject :: GenParser Char st JValue
jsonObject = do
  char '{'
  spaces
  object <- jsonObjectItem `sepBy` (char ',')
  spaces
  char '}'
  return $ JObject object
  
-- real: 42 
jsonObjectItem :: GenParser Char st (String,JValue)  
jsonObjectItem = do
  key <- jsonObjectItemKey
  value <- jsonObjectItemValue
  return $ (key,value)
  
-- real:  
jsonObjectItemKey :: GenParser Char st String
jsonObjectItemKey = many (noneOf ":")

-- :42
jsonObjectItemValue :: GenParser Char st JValue
jsonObjectItemValue = do
  char ':'
  value <- jsonElem 
  return value

-- ==================================================================
-- lab1 part3
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
-- ==================================================================


parseJSON :: String -> Either ParseError JValue
parseJSON input = parse jsonFile "(unknown)" input

main = do
  args <- getArgs
  p <- parseFromFile jsonFile (head args)
  case p of
    Left err  -> print err
    Right json -> putStrLn $ JSON.toString json
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


