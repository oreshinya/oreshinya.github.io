module Main where

import Prelude

import Effect (Effect)
import Freedom as Freedom
import Freedom.Markup as H
import Freedom.TransformF.Simple (VQueryF, transformF, reduce)
import Freedom.VNode (VNode)

data Tab
  = Info
  | Work

derive instance eqTab :: Eq Tab

type State = Tab

type Html = VNode VQueryF State

main :: Effect Unit
main = Freedom.run
  { selector: "#app"
  , initialState: Info
  , subscriptions: []
  , transformF
  , view
  }

view :: State -> Html
view state =
  H.el $ H.div # H.css wholeCSS # H.kids
    [ H.el $ H.header # H.kids
        [ H.el $ H.h1 # H.css h1CSS # H.kids [ H.t "oreshinya.github.io" ]
        , H.el $ H.div # H.css topCSS # H.kids
            [ H.el $ H.div # H.css avatarCSS # H.kids
                [ H.el $ H.img # H.css avatarImgCSS # H.src "assets/profile.jpg" # H.alt "Profile"
                ]
            , H.el $ H.div # H.kids
                [ H.el $ H.h3 # H.kids [ H.t "ID" ]
                , H.el $ H.p # H.kids [ H.t "oreshinya" ]
                , H.el $ H.h3 # H.kids [ H.t "ソーシャルアカウント" ]
                , H.el $ H.div # H.css socialContainerCSS # H.kids
                    [ H.el $ H.a # H.css socialCSS # H.href "https://twitter.com/oreshinya" # H.kids
                        [ H.el $ H.img # H.css socialImgCSS # H.src "assets/twitter.svg" # H.alt "Twitter"
                        ]
                    , H.el $ H.a # H.css socialCSS # H.href "https://github.com/oreshinya" # H.kids
                        [ H.el $ H.img # H.css socialImgCSS # H.src "assets/github.svg" # H.alt "Github"
                        ]
                    , H.el $ H.a # H.css socialCSS # H.href "https://oreshinya.hatenablog.com" # H.kids
                        [ H.el $ H.img # H.css hatenaCSS # H.src "assets/hatena.svg" # H.alt "Hatena"
                        ]
                    ]
                ]
            ]
        , H.el $ H.div # H.css middleCSS # H.kids
            [ H.el $ H.a
                # H.css linkCSS
                # H.className (if state == Info then "active" else "")
                # H.onClick (const $ reduce $ const Info)
                # H.kids [ H.t "インフォメーション" ]
            , H.el $ H.a
                # H.css linkCSS
                # H.className (if state == Work then "active" else "")
                # H.onClick (const $ reduce $ const Work)
                # H.kids [ H.t "業務について" ]
            ]
        ]
    , H.el $ H.main_ # H.kids
        [ case state of
            Info -> H.keyed "info" info
            Work -> H.keyed "work" work
        ]
    ]

info :: Html
info =
  H.el $ H.div # H.kids
    [ H.el $ H.h2 # H.kids [ H.t "所属" ]
    , H.el $ H.p # H.kids [ H.t "フリーランス" ]
    , H.el $ H.h2 # H.kids [ H.t "職種" ]
    , H.el $ H.p # H.kids [ H.t "Webエンジニア" ]
    , H.el $ H.h2 # H.kids [ H.t "スキル" ]
    , H.el $ H.p # H.kids [ H.t "フロントエンドからインフラまでやります。" ]
    , H.el $ H.p # H.kids [ H.t "仕事上ではJavaScript, TypeScript, Flow, Ruby, Goを使う機会が多いです。" ]
    , H.el $ H.p # H.kids [ H.t "PureScriptを最も好んでおり、" ]
    , H.el $ H.p # H.kids [ H.t "仮想DOMや、サーバー向けライブラリなどのパッケージをつくっています。" ]
    , H.el $ H.p # H.kids [ H.t "インフラについては最近はもっぱらGCPとりわけGKEを使います。" ]
    ]

work :: Html
work =
  H.el $ H.div # H.kids
    [ H.el $ H.h2 # H.kids [ H.t "業務" ]
    , H.el $ H.p # H.kids [ H.t "以下はフリーランスとしての業務の例です。" ]
    , H.el $ H.ul # H.kids
        [ H.el $ H.li # H.kids [ H.t "フロントエンド環境の刷新(CoffeeScriptからの移行やwebpackへの移行等)" ]
        , H.el $ H.li # H.kids [ H.t "React/Reduxをベースとした、手数と設計負担を減らし、且つ、一様なコードを書くための仕組み化" ]
        , H.el $ H.li # H.kids [ H.t "データ分析基盤の構築" ]
        , H.el $ H.li # H.kids [ H.t "ドメインやシステムの都合上手を出しにくい、負債になっているテーブル群の全面的な再設計と実装とデータマイグレーション" ]
        , H.el $ H.li # H.kids [ H.t "AWSからGCPへのインフラ移行(主にGCP側やアプリケーションの修正、移行作業)" ]
        , H.el $ H.li # H.kids [ H.t "負債の溜まった決済基盤の全面的な再設計と実装" ]
        , H.el $ H.li # H.kids [ H.t "各種パフォーマンスチューニング" ]
        , H.el $ H.li # H.kids [ H.t "機械学習を用いた自然言語分野における分類器の作成とそれを用いたアプリケーションやインフラの構築" ]
        , H.el $ H.li # H.kids [ H.t "ざっくり要望をもらって、一人でサービスをリリース" ]
        , H.el $ H.li # H.kids [ H.t "PureScriptの導入" ]
        , H.el $ H.li # H.kids [ H.t "WebRTCを用いたシステムの開発" ]
        ]
    , H.el $ H.p # H.kids [ H.t "など、多義に渡ります。" ]
    , H.el $ H.p # H.kids [ H.t "技術的課題のタスクは特性上ソロあるいはほぼソロであたるような業務が多めですが、複数人での通常の機能開発もやります。" ]
    , H.el $ H.h2 # H.kids [ H.t "仕事のご依頼" ]
    , H.el $ H.p # H.kids [ H.t "TwitterのDMにて受け付けております。" ]
    ]

wholeCSS :: String
wholeCSS =
  """
  body {
    margin: 0;
    font-family: 'Montserrat', 'M PLUS Rounded 1c', sans-serif;
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
