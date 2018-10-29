module Msgs exposing (..)

import Models exposing (Square)


type Msg
    = NoOp
    | RestartGame
    | RandomizeSquares (List Square)
    | ClickBox Square
    | CloseSquares
