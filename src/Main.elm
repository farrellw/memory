module Main exposing (..)

import Html exposing (program)
import Models exposing (GameState, Model, Square)
import Msgs exposing (Msg)
import Update exposing (restartGame, update)
import View exposing (view)


possibleTexts : List String
possibleTexts =
    [ "\x1F92A", "\x1F929", "😃", "😄", "😂", "\x1F920", "😤", "\x1F92A", "😤", "\x1F913", "😂", "\x1F913", "\x1F920", "\x1F929", "😃", "😄" ]


newSquare : Int -> String -> Square
newSquare index label =
    { state = Models.Closed
    , text = label
    , id = index
    }



-- Initial Model


initialModel : Model
initialModel =
    { squares = List.indexedMap (\index value -> newSquare index value) possibleTexts
    , state = Models.Clickable
    , points = 0
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, restartGame initialModel.squares )



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
