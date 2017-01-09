import Html exposing (Html, div, text, a, img)
import Html.Attributes exposing (style, href, target, src)
import Html.Events exposing (onClick)
import Html.CssHelpers
import Task
import Window
import Random
import Mouse
import Css

import Style exposing (CssClass(..))



-- Model
type alias Model =
  { windowWidth : Float
  , windowHeight : Float
  , loupeX : Float
  , loupeY : Float
  , oreshinyaX : Float
  , oreshinyaY : Float
  , visibleInfo : Bool
  , linkData : List (String, String)
  }

initialModel : Model
initialModel =
  { windowWidth = 0
  , windowHeight = 0
  , loupeX = 0
  , loupeY = 0
  , oreshinyaX = 0
  , oreshinyaY = 0
  , visibleInfo = False
  , linkData =
    [ ( "https://github.com/oreshinya", "./images/github.png" )
    , ( "https://twitter.com/oreshinya", "./images/twitter.png" )
    , ( "https://oreshinya.github.io/profile.html", "./images/profile.png" )
    ]
  }

init : (Model, Cmd Msg)
init =
  ( initialModel, Task.perform WindowSize Window.size )



-- Update
type Msg = ShowInfo
         | MoveLoupe Int Int
         | WindowSize Window.Size
         | InitLoupeX Float
         | InitLoupeY Float
         | InitOreshinyaX Float
         | InitOreshinyaY Float

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ShowInfo ->
      ({ model | visibleInfo = True }, Cmd.none)
    MoveLoupe x y ->
      ({ model | loupeX = toFloat <| x - 60
               , loupeY = toFloat <| y - 80 - 60 }
      , Cmd.none
      )
    WindowSize { width, height } ->
      ( { model | windowWidth = toFloat width, windowHeight = toFloat height }
      , Cmd.batch
        [ Random.generate InitLoupeX (Random.float 0 1)
        , Random.generate InitLoupeY (Random.float 0 1)
        , Random.generate InitOreshinyaX (Random.float 0 1)
        , Random.generate InitOreshinyaY (Random.float 0 1)
        ]
      )
    InitLoupeX f ->
      ({ model | loupeX = f * (model.windowWidth - 120) }, Cmd.none)
    InitLoupeY f ->
      ({ model | loupeY = f * (model.windowHeight - 200) }, Cmd.none)
    InitOreshinyaX f ->
      ({ model | oreshinyaX = f * (model.windowWidth - 60) }, Cmd.none)
    InitOreshinyaY f ->
      ({ model | oreshinyaY = f * (model.windowHeight - 140) }, Cmd.none)


-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  Mouse.moves (\{x, y} -> MoveLoupe x y)



-- View
styles = Css.asPairs >> style
{ class } = Html.CssHelpers.withNamespace "oreshinya"

view : Model -> Html Msg
view model = div [ class [ App ] ]
  [ div [ class [ TopContainer ] ] [ text "Where's oreshinya ?" ]
  , div [ class [ BottomContainer ] ]
    [ div [ class [ SearchArea ] ]
      [ div [ class [ Loupe ], styles <| loupeStyles model ]
        [ div [ class [ Field ], styles <| fieldStyles model ]
          [ div [ styles <| oreshinyaContainerStyles model ]
            [ div [ class [ Oreshinya ] ]
              [ div [ class <| imageContainerClass model ] <| List.map linkView model.linkData
              , div [ class <| bornClass model, onClick ShowInfo ] []
              ]
            ]
          ]
        ]
      ]
    ]
  ]

linkView : (String, String) -> Html Msg
linkView (url, imgPath) = a [ class [ ImageLink ], href url, target "_blank" ]
  [ img [ src imgPath ] [] ]

loupeStyles : Model -> List Css.Mixin
loupeStyles { loupeX, loupeY } =
  [ Css.top (Css.px loupeY)
  , Css.left (Css.px loupeX)
  ]

fieldStyles : Model -> List Css.Mixin
fieldStyles { loupeX, loupeY } =
  [ Css.top (Css.px <| -1 * loupeY)
  , Css.left (Css.px <| -1 * loupeX)
  ]

oreshinyaContainerStyles : Model -> List Css.Mixin
oreshinyaContainerStyles { oreshinyaX, oreshinyaY } =
  [ Css.marginTop (Css.px oreshinyaY)
  , Css.marginLeft (Css.px oreshinyaX)
  ]

imageContainerClass : Model -> List CssClass
imageContainerClass { visibleInfo } =
  if visibleInfo then
    [ ImageContainer, ClickedImageContainer ]
  else
    [ ImageContainer ]

bornClass : Model -> List CssClass
bornClass { visibleInfo } =
  if visibleInfo then
    [ Born, ClickedBorn ]
  else
    [ Born ]

-- Main
main = Html.program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }
