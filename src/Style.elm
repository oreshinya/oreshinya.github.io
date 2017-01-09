module Style exposing (..)

import Css exposing (..)
import Css.Namespace exposing (namespace)
import Css.Elements exposing (html, body)

type CssClass = App
              | TopContainer
              | BottomContainer
              | SearchArea
              | Field
              | Loupe
              | Oreshinya
              | ImageContainer
              | ClickedImageContainer
              | ImageLink
              | Born
              | ClickedBorn

styles = (stylesheet << namespace "oreshinya")
  [ html [ margin (px 0), height (pct 100) ]
  , body [ margin (px 0), height (pct 100) ]
  , (.) App [ height <| pct 100 ]
  , (.) TopContainer
    [ boxSizing borderBox
    , fontSize (px 24)
    , color (hex "FFFFFF")
    , height (px 80)
    , padding2 (px 0) (px 20)
    , displayFlex
    , property "justify-content" "flex-start"
    , alignItems center
    , position relative
    , property "z-index" "2"
    , backgroundColor (hex "00BCD4")
    , boxShadow4 (px 0) (px 2) (px 2) (hex "999999")
    ]
  , (.) BottomContainer
    [ property "height" "calc(100% - 80px)"
    , position relative
    , property "z-index" "1"
    ]
  , (.) SearchArea
    [ height (pct 100)
    , position relative
    , overflow hidden
    ]
  , (.) Field
    [ position absolute
    , width (pct 100)
    , property "height" "calc(100% - 80px)"
    ]
  , (.) Loupe
    [ position absolute
    , boxSizing borderBox
    , width (px 120)
    , height (px 120)
    , borderRadius (px 60)
    , border3 (px 4) solid (hex "999999")
    , overflow hidden
    ]
  , (.) Oreshinya
    [ width (px 60)
    , height (px 60)
    , displayFlex
    , property "justify-content" "center"
    , alignItems center
    , flexDirection column
    ]
  , (.) ImageContainer
    [ width (px 60)
    , displayFlex
    , property "justify-content" "space-between"
    , alignItems center
    , position relative
    , opacity (num 0)
    , property "pointer-events" "none"
    ]
  , (.) ClickedImageContainer
    [ property "animation" "jump-block 0.1s linear 0.1s 1"
    , property "animation-fill-mode" "forwards"
    , property "pointer-events" "auto"
    ]
  , (.) ImageLink [ display block ]
  , (.) Born
    [ position relative
    , width (px 32)
    , height (px 32)
    , backgroundImage (url "./images/hone.png")
    , backgroundSize2 (px 96) (px 128)
    , property "animation" "walk 1s step-start 0s infinite"
    ]
  , (.) ClickedBorn
    [ property "animation" "jump 0.1s linear 0s 1, walk 1s step-start 0s infinite" ]
  ]
