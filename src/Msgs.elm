module Msgs exposing (Msg(..))

import Models exposing (Square)


type Msg
    = NoOp
    | RestartGame
    | RandomizeSquares (List Square)
    | ClickBox Square
    | CloseSquares
