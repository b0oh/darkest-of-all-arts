module Slides.Slide6 exposing (slide)

import Element
import Element.Font as Font
import Layout
import Style


slide ({ height, width } as viewport) =
    let
        baseSize =
            round (toFloat height / 13.5)

        paraboloid1 =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.sym "z"
                , Layout.lit "="
                , Layout.sym "x"
                , Layout.lit "*"
                , Layout.sym "x"
                , Layout.lit "+"
                , Layout.sym "y"
                , Layout.lit "*"
                , Layout.sym "y"
                ]

        paraboloid2 =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.def baseSize "f" [ "x", "y" ]
                , Layout.lit "="
                , Layout.sym "x"
                , Layout.lit "*"
                , Layout.sym "x"
                , Layout.lit "+"
                , Layout.sym "y"
                , Layout.lit "*"
                , Layout.sym "y"
                ]

        paraboloid3 =
            Element.column
                []
                [ Element.row
                      [ Style.spacing baseSize ]
                      [ Layout.def baseSize "elliptic-paraboloid" [ "x", "y" ]
                      , Layout.lit "="
                      ]
                , Element.row
                    [ Style.spacing baseSize
                    , Style.nested baseSize
                    ]
                    [ Layout.sym "x"
                    , Layout.lit "*"
                    , Layout.sym "x"
                    , Layout.lit "+"
                    , Layout.sym "y"
                    , Layout.lit "*"
                    , Layout.sym "y"
                    ]
                ]

        paraboloid4 =
            Element.column
                []
                [ Element.row
                      [ Style.spacing baseSize ]
                      [ Layout.def baseSize "elliptic-paraboloid" [ "x" ]
                      , Layout.lit "="
                      ]
                , Element.column
                    [ Style.spacing baseSize
                    , Style.nested baseSize
                    ]
                    [ Element.row
                          [ Style.spacing baseSize ]
                          [ Layout.sym "y"
                          , Layout.arrow
                          ]
                    , Element.row
                        [ Style.spacing baseSize
                        , Style.nested baseSize
                        ]
                          [ Layout.sym "x"
                          , Layout.lit "*"
                          , Layout.sym "x"
                          , Layout.lit "+"
                          , Layout.sym "y"
                          , Layout.lit "*"
                          , Layout.sym "y"
                          ]
                    ]
                ]

        paraboloid5 =
            Element.column
                []
                [ Element.row
                      [ Style.spacing baseSize ]
                      [ Layout.sym "elliptic-paraboloid"
                      , Layout.lit "="
                      ]
                , Element.column
                    [ Style.spacing baseSize
                    , Style.nested baseSize
                    ]
                    [ Element.row
                          [ Style.spacing baseSize ]
                          [ Layout.sym "x"
                          , Layout.arrow
                          , Layout.sym "y"
                          , Layout.arrow
                          ]
                    , Element.row
                        [ Style.spacing baseSize
                        , Style.nested baseSize
                        ]
                          [ Layout.sym "x"
                          , Layout.lit "*"
                          , Layout.sym "x"
                          , Layout.lit "+"
                          , Layout.sym "y"
                          , Layout.lit "*"
                          , Layout.sym "y"
                          ]
                    ]
                ]

        paraboloid6 =
            Element.column
                []
                [ Element.row
                      [ Style.spacing baseSize ]
                      [ Layout.sym "elliptic-paraboloid"
                      , Layout.lit "="
                      ]
                , Element.column
                    [ Style.spacing baseSize
                    , Style.nested baseSize
                    ]
                    [ Element.row
                          [ Style.spacing baseSize ]
                          [ Element.row
                                []
                                [ Layout.sym "x"
                                , Layout.lit ", "
                                , Layout.sym "y"
                                ]
                          , Layout.arrow
                          ]
                    , Element.row
                        [ Style.spacing baseSize
                        , Style.nested baseSize
                        ]
                          [ Layout.sym "x"
                          , Layout.lit "*"
                          , Layout.sym "x"
                          , Layout.lit "+"
                          , Layout.sym "y"
                          , Layout.lit "*"
                          , Layout.sym "y"
                          ]
                    ]
                ]
    in
    Element.column
        [ Element.centerX
        , Element.centerY
        , Element.spacing baseSize
        , Font.size baseSize
        , Style.font_family
        ]
        [ paraboloid1
        , paraboloid2
        , paraboloid3
        , paraboloid4
        , paraboloid5
        , paraboloid6
        ]
            |> Element.el
               [ Element.height Element.fill
               , Element.width Element.fill
               ]
