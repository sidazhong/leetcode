import Text.ParserCombinators.Parsec
import System.Environment

-- This parser handles Scheme mathematical expressions.

-- The mathematical operator of a Scheme math expression.
type Op = Char

-- In our minimal subset, we support numbers and lists
-- beginning with a mathematical operator.
data SchemeExp =
    ScmNumber Integer      -- e.g.: 42
  | MathExp Op [SchemeExp] -- e.g.: (+ 1 2 (* 3 4) 5)
  deriving Show

-- A scheme file is made of many scheme lists
schemeFile :: GenParser Char st [SchemeExp]
schemeFile = do
  spaces
  exps <- many schemeList
  eof
  return exps

eol :: GenParser Char st String
eol = try (string "\n\r")
       <|> string "\n"
       <?> "end of line"

-- A scheme list must begin and end with parens.
-- Optionally, there may be an end of line after
-- the close paren.  (For simplicity, you do not
-- need to consider scheme lists that span multiple
-- lines.)
--
-- The first element of the list must be a mathematical
-- operator, from the set of '+', '-', '*', '/'.
-- The remaining elements should be either numbers
-- or embedded scheme lists, separated by spaces.
schemeList :: GenParser Char st SchemeExp
schemeList = do
  error "TBD"


parseScheme :: String -> Either ParseError [SchemeExp]
parseScheme input = parse schemeFile "(unknown)" input

main = do
  args <- getArgs
  p <- parseFromFile schemeFile (head args)
  case p of
    Left err  -> print err
    Right scm -> print scm

