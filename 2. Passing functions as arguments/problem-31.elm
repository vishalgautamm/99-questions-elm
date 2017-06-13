{--

Problem 31

Determine whether a given integer number is prime.
Example:
isPrime 113 == True


--}


module Main exposing (..)

import Html


isPrime : Int -> Bool
isPrime n =
    if n < 2 then
        False
    else
        eratos (abs n) (List.range 2 (n // 2))


eratos : Int -> List Int -> Bool
eratos n xs =
    case xs of
        [] ->
            True

        x :: xs ->
            if n % x == 0 then
                False
            else
                eratos n (List.filter (\y -> (y % x) /= 0) xs)



-- Unit Test


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
        [ ( isPrime 36, False )
        , ( isPrime 10, False )
        , ( isPrime -1, False )
        , ( isPrime 1, False )
        , ( isPrime 0, False )
        , ( isPrime 120, False )
        , ( isPrime 2, True )
        , ( isPrime 23, True )
        , ( isPrime 6000, False )
        , ( isPrime 7919, True )
        , ( isPrime 7911, False )
        , ( isPrime 63247, True )
        , ( isPrime 63249, False )
        ]
