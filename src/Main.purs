module Main where

import Prelude

import Data.Maybe (Maybe(..))
import Effect (Effect)
import Grain (class LocalGrain, LProxy(..), VNode, fromConstructor, mount, useUpdater, useValue)
import Grain.Markup as H
import Web.DOM.Element (toNode)
import Web.DOM.ParentNode (QuerySelector(..), querySelector)
import Web.HTML (window)
import Web.HTML.HTMLDocument (toParentNode)
import Web.HTML.Window (document)

data Tab
  = Info
  | Work

derive instance eqTab :: Eq Tab

instance localGrainTab :: LocalGrain Tab where
  initialState _ = pure Info
  typeRefOf _ = fromConstructor Info

main :: Effect Unit
main = do
  maybeEl <- window >>= document <#> toParentNode >>= querySelector (QuerySelector "#app")
  case maybeEl of
    Nothing -> pure unit
    Just el ->
      mount view $ toNode el

view :: VNode
view = H.component do
  tab <- useValue (LProxy :: _ Tab)
  updateTab <- useUpdater (LProxy :: _ Tab)
  let navigateInfo = updateTab $ const Info
      navigateWork = updateTab $ const Work
  pure $ H.div # H.css wholeCSS # H.kids
    [ H.header # H.kids
        [ H.h1 # H.css h1CSS # H.kids [ H.text "oreshinya.github.io" ]
        , H.div # H.css topCSS # H.kids
            [ H.div # H.css avatarCSS # H.kids
                [ H.img # H.css avatarImgCSS # H.src "assets/profile.jpg" # H.alt "Profile"
                ]
            , H.div # H.kids
                [ H.h3 # H.kids [ H.text "ID" ]
                , H.p # H.kids [ H.text "oreshinya" ]
                , H.h3 # H.kids [ H.text "ソーシャルアカウント" ]
                , H.div # H.css socialContainerCSS # H.kids
                    [ H.a # H.css socialCSS # H.href "https://twitter.com/oreshinya" # H.kids
                        [ H.img # H.css socialImgCSS # H.src "assets/twitter.svg" # H.alt "Twitter"
                        ]
                    , H.a # H.css socialCSS # H.href "https://github.com/oreshinya" # H.kids
                        [ H.img # H.css socialImgCSS # H.src "assets/github.svg" # H.alt "Github"
                        ]
                    , H.a # H.css socialCSS # H.href "https://oreshinya.hatenablog.com" # H.kids
                        [ H.img # H.css hatenaCSS # H.src "assets/hatena.svg" # H.alt "Hatena"
                        ]
                    ]
                ]
            ]
        , H.div # H.css middleCSS # H.kids
            [ H.a
                # H.css linkCSS
                # H.className (if tab == Info then "active" else "")
                # H.onClick (const navigateInfo)
                # H.kids [ H.text "インフォメーション" ]
            , H.a
                # H.css linkCSS
                # H.className (if tab == Work then "active" else "")
                # H.onClick (const navigateWork)
                # H.kids [ H.text "業務について" ]
            ]
        ]
    , H.main_ # H.kids
        [ case tab of
            Info -> H.key "info" info
            Work -> H.key "work" work
        ]
    ]

info :: VNode
info =
  H.div # H.kids
    [ H.h2 # H.kids [ H.text "所属" ]
    , H.p # H.kids [ H.text "フリーランス" ]
    , H.h2 # H.kids [ H.text "職種" ]
    , H.p # H.kids [ H.text "Webエンジニア" ]
    , H.h2 # H.kids [ H.text "スキル" ]
    , H.p # H.kids [ H.text "フロントエンドからインフラまでやります。" ]
    , H.p # H.kids [ H.text "仕事上ではJavaScript, TypeScript, Flow, Ruby, Goを使う機会が多いです。" ]
    , H.p # H.kids [ H.text "PureScriptを最も好んでおり、" ]
    , H.p # H.kids [ H.text "仮想DOMや、サーバー向けライブラリなどのパッケージをつくっています。" ]
    , H.p # H.kids [ H.text "インフラについては最近はもっぱらGCPとりわけGKEを使います。" ]
    ]

work :: VNode
work =
  H.div # H.kids
    [ H.h2 # H.kids [ H.text "業務" ]
    , H.p # H.kids [ H.text "以下はフリーランスとしての業務の例です。" ]
    , H.ul # H.kids
        [ H.li # H.kids [ H.text "フロントエンド環境の刷新(CoffeeScriptからの移行やwebpackへの移行等)" ]
        , H.li # H.kids [ H.text "React/Reduxをベースとした、手数と設計負担を減らし、且つ、一様なコードを書くための仕組み化" ]
        , H.li # H.kids [ H.text "データ分析基盤の構築" ]
        , H.li # H.kids [ H.text "ドメインやシステムの都合上手を出しにくい、負債になっているテーブル群の全面的な再設計と実装とデータマイグレーション" ]
        , H.li # H.kids [ H.text "AWSからGCPへのインフラ移行(主にGCP側やアプリケーションの修正、移行作業)" ]
        , H.li # H.kids [ H.text "負債の溜まった決済基盤の全面的な再設計と実装" ]
        , H.li # H.kids [ H.text "各種パフォーマンスチューニング" ]
        , H.li # H.kids [ H.text "機械学習を用いた自然言語分野における分類器の作成とそれを用いたアプリケーションやインフラの構築" ]
        , H.li # H.kids [ H.text "ざっくり要望をもらって、一人でサービスをリリース" ]
        , H.li # H.kids [ H.text "PureScriptの導入" ]
        , H.li # H.kids [ H.text "WebRTCを用いたシステムの開発" ]
        ]
    , H.p # H.kids [ H.text "など、多義に渡ります。" ]
    , H.p # H.kids [ H.text "技術的課題のタスクは特性上ソロあるいはほぼソロであたるような業務が多めですが、複数人での通常の機能開発もやります。" ]
    , H.h2 # H.kids [ H.text "仕事のご依頼" ]
    , H.p # H.kids [ H.text "TwitterのDMにて受け付けております。" ]
    ]

wholeCSS :: String
wholeCSS =
  """
  body {
    margin: 0;
    font-family: 'Montserrat', sans-serif;
    color: #111111;
    background-color: #fcfcfc;
  }
  p, li {
    color: #333333;
  }
  a {
    cursor: pointer;
    text-decoration: none;
  }
  .& {
    width: 720px;
    margin: 64px auto;
  }
  """

h1CSS :: String
h1CSS =
  """
  .& {
    font-weight: normal;
    text-align: center;
    margin: 0 0 64px;
  }
  """

topCSS :: String
topCSS =
  """
  .& {
    padding: 0 160px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: 64px;
  }
  """

avatarCSS :: String
avatarCSS =
  """
  .& {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 128px;
    height: 128px;
    border-radius: 8px;
    overflow: hidden;
  }
  """

avatarImgCSS :: String
avatarImgCSS =
  """
  .& {
    width: 100%;
  }
  """

socialContainerCSS :: String
socialContainerCSS =
  """
  .& {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  """

socialCSS :: String
socialCSS =
  """
  .& {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 48px;
    height: 48px;
    border-radius: 50%;
    overflow: hidden;
  }
  """

socialImgCSS :: String
socialImgCSS =
  """
  .& {
    width: 100%;
    height: 100%;
  }
  """

hatenaCSS :: String
hatenaCSS =
  """
  .& {
    width: 150%;
    height: 150%;
  }
  """

middleCSS :: String
middleCSS =
  """
  .& {
    text-align: center;
  }
  """

linkCSS :: String
linkCSS =
  """
  .& {
    font-size: 24px;
    margin-right: 16px;
  }
  .&:hover {
    font-weight: bold;
  }
  .&.active {
    pointer-events: none;
    font-weight: bold;
  }
  .&:last-of-type {
    margin-right: 0;
  }
  """
