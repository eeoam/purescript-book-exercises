module Data.AddressBook where

import Prelude

import Control.Plus (empty)
import Data.List (List(..), filter, head, nubBy, null)
import Data.Maybe (Maybe)

type Address =
  { street :: String
  , city   :: String
  , state  :: String
  }

type Entry =
  { firstName :: String
  , lastName  :: String
  , address   :: Address
  }

type AddressBook = List Entry

showAddress :: Address -> String
showAddress addr = addr.street <> ", " <> addr.city <> ", " <> addr.state

showEntry :: Entry -> String
showEntry entry = entry.lastName <> ", " <> entry.firstName <> ": " <> showAddress entry.address

emptyBook :: AddressBook
emptyBook = empty

insertEntry :: Entry -> AddressBook -> AddressBook
insertEntry = Cons

findEntry :: String -> String -> AddressBook -> Maybe Entry
findEntry firstName lastName = head <<< filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.firstName == firstName && entry.lastName == lastName


-- (Easy) Test your understanding of the findEntry function by writing down the types of each of its major subexpressions. For example, the type of the head function as used is specialized to AddressBook -> Maybe Entry.
-- (Medium) Write a function which looks up an Entry given a street address, by reusing the existing code in findEntry. Test your function in PSCi.
-- (Medium) Write a function which tests whether a name appears in a AddressBook, returning a Boolean value. Hint: Use PSCi to find the type of the Data.List.null function, which test whether a list is empty or not.
-- (Difficult) Write a function removeDuplicates which removes duplicate address book entries with the same first and last names. Hint: Use PSCi to find the type of the Data.List.nubBy function, which removes duplicate elements from a list based on an equality predicate.

-- 1
-- head :: AddressBook -> Maybe Entry
-- filter filterEntry :: List Entry -> List Entry
-- filter filterEntry :: AddressBook -> AddressBook
-- entry.firstName :: String
-- entry.lastName :: String

-- 2

findEntryByStreetAddress :: Address -> AddressBook -> Maybe Entry
findEntryByStreetAddress address = head <<< filter filterEntry
  where
    filterEntry :: Entry -> Boolean
    filterEntry entry = entry.address == address

-- 3

nameAppears :: String -> String -> AddressBook -> Boolean
nameAppears firstName lastName = null <<< filter filterEntry
  where
  filterEntry :: Entry -> Boolean
  filterEntry entry = entry.firstName == firstName && entry.lastName == lastName

removeDuplicates :: AddressBook -> AddressBook
removeDuplicates = nubBy (\x y -> x.firstName == y.firstName && x.lastName == y.lastName)
