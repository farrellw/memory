module Update exposing (..)

import Models exposing (Model, Square)
import Msgs exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )

        Msgs.ClickBox square ->
            ( model
                |> updateIsClicked square.id
                |> updateSuccess
                |> turnBackOver
            , Cmd.none
            )


turnBackOver : List Square -> Model
turnBackOver squares =
    if List.length (List.filter (\square -> filterClicked square) squares) == 2 then
        List.map (\square -> turnClosed square) squares
    else
        squares


turnClosed : Square -> Square
turnClosed square =
    if square.state == Models.Opened then
        { square | state = Models.Closed }
    else
        square


filterClicked : Square -> Bool
filterClicked square =
    square.state == Models.Opened


updateSuccess : List Square -> Model
updateSuccess squares =
    if haveMatch (List.filter (\square -> filterClicked square) squares) then
        Debug.log "I have a match"
            List.map
            (\square -> matchSquare square)
            squares
    else
        Debug.log "NO no match"
            squares


matchSquare : Square -> Square
matchSquare square =
    if square.state == Models.Opened then
        { square | state = Models.Matched }
    else
        square


updateIsClicked : Int -> List Square -> List Square
updateIsClicked id squares =
    let
        updatedSquares =
            List.map (\square -> updateSquare square id) squares
    in
    updatedSquares


updateSquare : Square -> Int -> Square
updateSquare square id =
    if square.id == id then
        { square | state = Models.Opened }
    else
        square


haveMatch : List Square -> Bool
haveMatch squares =
    case squares of
        a :: b :: [] ->
            a.text == b.text

        _ ->
            False
