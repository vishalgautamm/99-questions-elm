-- Determine if a string is a palindrome, that is, the list is identical when read forward or backward.


module Main exposing (..)

import String
import List
import Regex


-- filterAndReverse : String -> String
-- filterAndReverse str =
--     str
--         |> Regex.replace Regex.All (Regex.regex "[^a-zA-Z0-9]") (\_ -> "")
--         |> String.reverse
--         |> String.toUpper
--
--
-- isPalindromeStr : String -> Bool
-- isPalindromeStr str =
--     filterAndReverse str == String.toUpper str


type Palindrome
    = String
    | List Char


pally : Palindrome -> Bool
pally xs =
    case xs of
        String ->
            String.reverse xs == xs

        List Char ->
            List.reverse xs == xs
