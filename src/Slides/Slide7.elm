module Slides.Slide7 exposing (slide)

import Element
import Element.Font as Font
import Layout
import Style


slide ({ height, width } as viewport) =
    let
        baseSize =
            round (toFloat height / 13.5)

        zero =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.def baseSize "zero" [ "next", "init" ]
                , Layout.lit "="
                , Layout.sym "init"
                ]

        one =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.def baseSize "one" [ "next", "init" ]
                , Layout.lit "="
                , Layout.apply baseSize (Layout.sym "next") [ (Layout.sym "init") ]
                ]

        two =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.def baseSize "two" [ "next", "init" ]
                , Layout.lit "="
                , Layout.apply
                    baseSize
                    (Layout.sym "next")
                    [ Layout.apply
                          baseSize
                          (Layout.sym "next")
                          [ (Layout.sym "init") ]
                    ]
                ]

        three =
            Element.row
                [ Style.spacing baseSize ]
                [ Layout.def baseSize "three" [ "next", "init" ]
                , Layout.lit "="
                , Layout.apply
                    baseSize
                    (Layout.sym "next")
                    [ Layout.apply
                          baseSize
                          (Layout.sym "next")
                          [ Layout.apply
                                baseSize
                                (Layout.sym "next")
                                [ (Layout.sym "init") ]
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
        [ zero
        , one
        , two
        , three
        ]
            |> Element.el
               [ Element.height Element.fill
               , Element.width Element.fill
               ]
