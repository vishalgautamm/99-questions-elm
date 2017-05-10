-- Determine if a string is a palindrome, that is, the list is identical when read forward or backward.


module Main exposing (..)

import String
import Regex


filterAndReverse : String -> String
filterAndReverse str =
    str
        |> Regex.replace Regex.All (Regex.regex "[^a-zA-Z0-9]") (\_ -> "")
        |> String.reverse
        |> String.toUpper


isPalindromeStr : String -> Bool
isPalindromeStr str =
    filterAndReverse str == String.toUpper str
