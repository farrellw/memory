module Models exposing (..)


type alias Model =
    AllSquares


type alias AllSquares =
    List Square


type SquareState
    = Closed
    | Opened
    | Matched


type alias Square =
    { state : SquareState
    , text : String
    , id : Int
    }
