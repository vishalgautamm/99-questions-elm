-- Determine if a list is a palindrome, that is, the list is identical when read forward or backward.


module Main exposing (..)

import Html
import List
import Maybe


-- Solution 1
-- myReverse : List a -> List a
-- myReverse xs =
--     List.foldl (::) [] xs
--
--
-- isPalindrome : List a -> Bool
-- isPalindrome xs =
--     if (myReverse xs) == xs then
--         True
--     else
--         False
--
--
-- Solution 2
-- isPalindrome : List a -> Bool
-- isPalindrome xs =
--     List.reverse xs == xs
--
--
-- Solution 3: takes half as many concepts


isPalindrome : List a -> Bool
isPalindrome xs =
    let
        len =
            List.length xs
    in
        List.take len xs == List.take len (List.reverse xs)


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
            [ isPalindrome [ 1, 3, 5, 8, 5, 3, 1 ] == True
            , isPalindrome [ 2, 1 ] == False
            , isPalindrome [ 1 ] == True
            , isPalindrome [] == True
            , isPalindrome [ "aa", "bb", "aa" ] == True
            , isPalindrome [ "aab", "b", "aa" ] == False
            ]
