module Style exposing (..)

import Element
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Element.Input as Input


white =
    Element.rgb 1 1 1


blue =
    Element.rgb 0 0 0.8


dark_blue =
    Element.rgb 0 0 0.9


small_spacing base_size =
    Element.spacing <| base_size // 8


spacing base_size =
    Element.spacing <| base_size // 3


nested baseSize =
    Element.paddingEach
        { top = 0
        , right = 0
        , bottom = 0
        , left = baseSize
        }


modern_serif =
    Font.external
        { name = "Computer Modern Serif"
        , url = "/fonts/cmun-serif.css"
        }


font_family =
    Font.family
        [ modern_serif
        , Font.serif
        ]


font_attrs base_size =
    [ Font.size base_size
    , font_family
    ]


button_attrs =
    [ Background.color blue
    , Font.color white
    , Border.color dark_blue
    , Element.paddingXY 32 16
    , Border.rounded 3
    , Element.width Element.fill
    ]
