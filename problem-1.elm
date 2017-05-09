-- Write a function last that returns the last element of a list.
-- An empty list doesn't have a last element, therefore last must return a Maybe.


module Main exposing (..)

import Html exposing (text)
import Maybe


-- Solution 1 : Recursion
-- last : List a -> Maybe a
-- last xs =
--     case xs of
--         [] ->
--             Nothing
--
--         [ x ] ->
--             Just x
--
--         h :: ys ->
--             last ys
--
--
-- Solution 2: Reverse the list and take head
-- last : List a -> Maybe a
-- last xs =
--     xs
--         |> List.reverse
--         |> List.head
--
--
-- Solution 3: point free
-- last : List a -> Maybe a
-- last =
--     List.reverse >> List.head


main : Html.Html msg
main =
    case last [ 1, 2, 3, 4 ] of
        Just a ->
            text (toString a)

        Nothing ->
            text "No element found"
