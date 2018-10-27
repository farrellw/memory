module Update exposing (..)

import Models exposing (Model, Square)
import Msgs exposing (Msg)
import Time exposing(Time, second)
import Process exposing (sleep)
import Task exposing(perform)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )

        Msgs.ClickBox square ->
            ( model
                |> updateOpenedSquares square.id
                |> updateMatchedSquares
            , delay (second * 2) Msgs.CloseSquares
            )
        Msgs.CloseSquares ->
            ( updateClosedSquares model
            , Cmd.none
            )    

delay : Time -> msg -> Cmd msg
delay time msg =
  sleep time
  |> perform (\_ -> msg)


updateOpenedSquares : Int -> List Square -> List Square
updateOpenedSquares id squares =
    let
        updatedSquares =
            List.map (\square -> openSelectedSquare square id) squares
    in
    updatedSquares


openSelectedSquare : Square -> Int -> Square
openSelectedSquare square id =
    if square.id == id && square.state == Models.Closed then
        { square | state = Models.Opened }
    else
        square


updateMatchedSquares : List Square -> Model
updateMatchedSquares squares =
    if matchExists (filterOpened squares) then
        List.map
            (\square -> matchOpenedSquare square)
            squares
    else
        squares


matchOpenedSquare : Square -> Square
matchOpenedSquare square =
    if square.state == Models.Opened then
        { square | state = Models.Matched }
    else
        square


matchExists : List Square -> Bool
matchExists squares =
    case squares of
        a :: b :: [] ->
            a.text == b.text

        _ ->
            False


updateClosedSquares : List Square -> Model
updateClosedSquares squares =
    if List.length (filterOpened squares) >= 2 then
        List.map (\square -> closeOpenedSquare square) squares
    else
        squares


closeOpenedSquare : Square -> Square
closeOpenedSquare square =
    if square.state == Models.Opened then
        { square | state = Models.Closed }
    else
        square


filterOpened : List Square -> List Square
filterOpened squares =
    List.filter (\square -> isOpened square) squares


isOpened : Square -> Bool
isOpened square =
    square.state == Models.Opened
