-- Elm provides the function List.length. See if you can implement it yourself.


module Main exposing (..)

import Html
import List
import Maybe


countElements : List a -> Int
countElements xs =
    let
        countElements_ xs_ acc_ =
            case xs_ of
                [] ->
                    acc_

                y :: ys_ ->
                    countElements_ ys_ (acc_ + 1)
    in
        countElements_ xs 0



-- Test Cases


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
            [ countElements (List.range 1 4000) == 4000
            , countElements [ 1 ] == 1
            , countElements [] == 0
            , countElements [ 'a', 'b', 'c' ] == 3
            ]
