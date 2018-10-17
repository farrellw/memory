module Models exposing (..)


type alias Model =
    AllSquares


type alias AllSquares =
    List Square


type alias Square =
    { matched : Bool
    , clicked : Bool
    , text : String
    , id : Int
    }
