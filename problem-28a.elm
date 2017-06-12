{--
List.sort will sort a list from lowest to highest.
List.sort [3, 5, 1, 10 -2] == [-2, 1, 3, 5, 10]
When you need other sort logic pass a function to List.sortBy.
Sort a list of list by the length of the lists. The order of sublists of the same size is undefined.
Example

lists = [[1],[2],[3,4,5],[6,7,8],[2,3],[4,5],[6,7,8,9,0]]
map List.length (sortByListLengths lists) == [1, 1, 2, 2, 3, 3, 5]


--}


module Main exposing (..)

import Html
import List


sortByListLengths : List (List a) -> List (List a)
sortByListLengths xs =
  List.sortBy List.length xs

-- UNIT Tests


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
    List.length
        <| List.filter ((==) False)
            [ List.map List.length (sortByListLengths [ [], [ 1 ], (1..2), (1..3), (1..4), (1..5) ])
                == [ 0, 1, 2, 3, 4, 5 ]
            , List.map List.length (sortByListLengths [ [] ])
                == [ 0 ]
            , List.map List.length (sortByListLengths [ [], [ 1 ], (1..100000), (1..4), (1..3), (1..2) ])
                == [ 0, 1, 2, 3, 4, 100000 ]
            , List.map List.length (sortByListLengths [ [ 14 ], [ 15 ], [], [ 1 ], [ 12 ], [ 13 ] ])
                == [ 0, 1, 1, 1, 1, 1 ]
            , List.map List.length (sortByListLengths [ [ "a", "b", "c" ], [ "a", "b" ], [ "a" ] ])
                == [ 1, 2, 3 ]
            ]


(..) : Int -> Int -> List Int
(..) start end =
    List.range start end
