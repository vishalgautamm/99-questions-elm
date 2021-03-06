module Main exposing (..)

import Html exposing (..)
import List exposing (..)


{-
   Calculate Euler's totient function phi(m).
   Euler's totient function phi(m) is defined as the number of positive integers r (1 <= r < m) that are coprime with m.
-}


totient : Int -> Int
totient n =
    List.range 1 n
        |> List.filter (\x -> coprime n x)
        |> List.length


coprime : Int -> Int -> Bool
coprime a b =
    gcd a b == 1


gcd : Int -> Int -> Int
gcd a b =
    if b == 0 then
        a
    else
        gcd (abs b) (a % b)


main : Html msg
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            n ->
                "Your implementation failed " ++ (toString n) ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ totient 10 == 4
            , totient 25 == 20
            , totient 120 == 32
            , totient 0 == 0
            , totient 1600 == 640
            , totient 37 == 36
            , totient 330 == 80
            , totient 65934 == 19440
            , totient 1313 == 1200
            , totient 45 == 24
            , totient -23 == 0
            ]
