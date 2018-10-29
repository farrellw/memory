module Msgs exposing (..)

import Models exposing (AllSquares, Square)


type Msg
    = NoOp
    | RestartGame
    | RandomizeSquares AllSquares
    | ClickBox Square
    | CloseSquares
