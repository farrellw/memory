module Main exposing (..)

-- Try Map First
-- Try A dictionary next

import Html exposing (program)
import Models exposing (AllSquares, Model, Square)
import Msgs exposing (Msg)
import Update exposing (update)
import View exposing (view)


possibleTexts : List String
possibleTexts =
    [ "A", "B", "G", "H", "C", "F", "D", "A", "D", "E", "C", "E", "F", "B", "G", "H" ]


newModel : Int -> String -> Square
newModel index label =
    { state = Models.Closed
    , text = label
    , id = index
    }



-- Initial Model


initialModel : Model
initialModel =
    List.indexedMap (\index value -> newModel index value) possibleTexts


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE
-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
