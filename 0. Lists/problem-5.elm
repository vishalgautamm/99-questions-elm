module Main exposing (..)

import Html exposing (text)
import List


-- Solution 1 : Recursion
-- myReverse : List a -> List a
-- myReverse xs =
--     case xs of
--         [] ->
--             []
--
--         y :: ys ->
--             (myReverse ys) ++ [ y ]
--
-- Solution 2: Recursion with counter
-- myReverse : List a -> List a
-- myReverse xs =
--     let
--         myReverse_ xs_ li_ =
--             case xs_ of
--                 [] ->
--                     li_
--
--                 y :: ys ->
--                     (myReverse ys) ++ (y :: li_)
--     in
--         myReverse_ xs []
--
-- Solution 3: using List.fold;


myReverse : List a -> List a
myReverse xs =
    List.foldl (::) [] xs


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            n ->
                "Your implementation failed " ++ toString n ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ myReverse [ 1, 2, 3, 4 ] == [ 4, 3, 2, 1 ]
            , myReverse [ 2, 1 ] == [ 1, 2 ]
            , myReverse [ 1 ] == [ 1 ]
            , myReverse [] == []
            , myReverse [ 'a', 'b', 'c' ] == [ 'c', 'b', 'a' ]
            ]
