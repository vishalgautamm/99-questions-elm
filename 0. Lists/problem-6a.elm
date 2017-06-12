-- Determine if a string is a palindrome, that is, the list is identical when read forward or backward.


module Main exposing (..)

import Html
import List
import Maybe
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



-- UNIT TESTS


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ (toString x) ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ isPalindromeStr "bob" == True
            , isPalindromeStr "hello" == False
            , isPalindromeStr "Civic" == True
            , isPalindromeStr "" == True
            , isPalindromeStr "mom" == True
            , isPalindromeStr "elm" == False
            ]
