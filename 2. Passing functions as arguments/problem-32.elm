module Main exposing (..)

import Html
import List


gcd: Int -> Int -> Int
gcd a b =
  if b == 0 then
    a
  else
    gcd (abs b) (a%b)


main : Html.Html msg
main =
    Html.text
        (if (test) then
            "Your implementation passed all tests."
         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all (\( result, expect ) -> result == expect)
        [ ( gcd 36 63, 9 )
        , ( gcd 10 25, 5 )
        , ( gcd 120 120, 120 )
        , ( gcd 2 12, 2 )
        , ( gcd 23 37, 1 )
        , ( gcd 45 330, 15 )
        , ( gcd 24528 65934, 6 )
        , ( gcd 120 -120, 120 )
        , ( gcd -2 12, 2 )
        , ( gcd 37 23, 1 )
        ]


(..) : Int -> Int -> List Int
(..) start end =
    List.range start end
