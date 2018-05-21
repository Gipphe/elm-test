import Html exposing (Html, button, div, text, hr)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

--- COMPONENTS

hr_comp : Html Msg
hr_comp =
  hr [] []

--- MODEL

type alias Model = Int

model : Model
model =
  0

--- UPDATE

type Msg = Increment | Decrement | Reset

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1
    Decrement ->
      model - 1
    Reset ->
      0

--- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    , hr_comp
    , button [ onClick Reset ] [ text "Reset" ]
    ]
