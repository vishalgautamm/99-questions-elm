{--

Rotate a list n places to the left (negative values will rotate to the right). Allow rotations greater than the list length.
Example

[rotate 3 (List.range 1 10), rotate 11 (List.range 1 10) ] ==
  [ [4, 5, 6, 7, 8, 9, 10, 1, 2, 3]
  , [2, 3, 4, 5, 6, 7, 8, 9, 10, 1]
  ]

--}


module Main exposing (..)

import Html
import List


rotate : Int -> List a -> List a
rotate rot list =
    let
        r =
            rot % (List.length list)
    in
        (List.drop r list) ++ (List.take r list)



-- if list == [] then
--     []
-- else if rot > 0 then
--     (List.drop (rem rot (List.length list)) list)
--         ++ (List.take (rem rot (List.length list)) list)
-- else
--     (List.drop ((List.length list) - (rem (abs rot) (List.length list))) list)
--         ++ (List.take ((List.length list) - (rem (abs rot) (List.length list))) list)


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
            [ rotate 3 [ 1, 2, 5, 5, 2, 1 ] == [ 5, 2, 1, 1, 2, 5 ]
            , rotate 13 (List.range 1 10) == [ 4, 5, 6, 7, 8, 9, 10, 1, 2, 3 ]
            , rotate 1 (List.range 1 5) == [ 2, 3, 4, 5, 1 ]
            , rotate 0 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , rotate -1 (List.range 1 5) == [ 5, 1, 2, 3, 4 ]
            , rotate -6 (List.range 1 5) == [ 5, 1, 2, 3, 4 ]
            , rotate 3 (List.range 1 5) == [ 4, 5, 1, 2, 3 ]
            , rotate 1 [ "1", "2", "3", "4" ] == [ "2", "3", "4", "1" ]
            ]
