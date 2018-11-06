module Main exposing (init, initialModel, main, newSquare, possibleTexts, subscriptions)

import Html exposing (..)
import Models exposing (GameState, Model, Square)
import Msgs exposing (Msg)
import Update exposing (restartGame, update)
import View exposing (view)
import Browser exposing (application)


possibleTexts : List String
possibleTexts =
    [ "\u{1F92A}", "\u{1F929}", "😃", "😄", "😂", "\u{1F920}", "😤", "\u{1F92A}", "😤", "\u{1F913}", "😂", "\u{1F913}", "\u{1F920}", "\u{1F929}", "😃", "😄" ]


newSquare : Int -> String -> Square
newSquare index label =
    { state = Models.Closed
    , text = label
    , id = index
    }



-- Initial Model

type alias Flags =
    Maybe{}

initialModel : Model
initialModel =
    { squares = List.indexedMap (\index value -> newSquare index value) possibleTexts
    , state = Models.Clickable
    , points = 0
    }


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( initialModel, restartGame initialModel.squares )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
