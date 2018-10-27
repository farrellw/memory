module Models exposing (..)


type alias Model =
    { squares: AllSquares
    , state: GameState
    }

type GameState
    = Frozen 
    | Clickable
    | GameOver

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
