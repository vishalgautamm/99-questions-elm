{--

Problem 31

Determine whether a given integer number is prime.
Example:
isPrime 113 == True


--}


module Main exposing (..)

import Html


primeNumb : List Int
primeNumb =
    [ 2, 3, 5, 7 ]


isPrime : Int -> Bool
isPrime n =
    if List.member n primeNumb then
        True
    else if n % 2 == 0 then
        False
    else if n % 3 == 0 then
        False
    else if n % 5 == 0 then
        False
    else if n % 7 == 0 then
        False
    else if n <= 1 then
        False
    else
        True



-- Unit Test


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
