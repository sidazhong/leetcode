
data Employee = Employee String String String Integer deriving (Show)

-- Helper functions for working with Employee objects.
getFirstName (Employee fName _ _ _) = fName
getLastName (Employee _ lName _ _) = lName
getTitle (Employee _ _ title _) = title
getSalary (Employee _ _ _ sal) = sal

isManager (Employee _ _ "Manager" _) = True
isManager (Employee _ _ _ _) = False


--A sample list of employees.  All glory to the Hypnotoad.
empList = [ (Employee "Phillip" "Fry" "Delivery Boy" 40000),
            (Employee "Turanga" "Leela" "Manager" 80000),
            (Employee "Bender" "Rodriguez" "Bending Unit" 50000),
            (Employee "Amy" "Wong" "Research Assistant" 55000),
            (Employee "Hermes" "Conrad" "Manager" 100000),
            (Employee "Dr." "Zoidburg" "Medical Doctor" 100),
            (Employee "Prof." "Farnsworth" "Manager" 350000)]

-- Return the total pay for all managers, without using recursion.
-- Your solution must use higher order functions.
totalManagerPayroll :: [Employee] -> Integer
totalManagerPayroll emps =
  error "TBD"

-- Without using recursion, return a list of the names of all employees
-- earning less than the specified amount.  The names should be formatted
-- "last, first".  For example, in both cases "Fry, Philip" should be an
-- element of the list.
--
-- As with the previous problem, your solution must use higher-order
-- functions for full credit.
empsWithPayLowerThan :: Ingeter -> [Employee] -> [String]
empsWithPayLowerThan amt emps =
  error "TBD"

main = do
  print $ totalManagerPayroll empList
  print $ totalManagerPayroll ((Employee "Zapp" "Brannigan" "Manager" 80000) : empList)
  print $ empsWithPayLowerThan 45000 empList
  print $ empsWithPayLowerThan 60000 empList

