
unit sokol_color;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_color.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_color.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Psg_color  = ^sg_color;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



function sg_make_color_4b(r:Tuint8_t; g:Tuint8_t; b:Tuint8_t; a:Tuint8_t):Tsg_color;cdecl;external;
function sg_make_color_1i(rgba:Tuint32_t):Tsg_color;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sg_color_lerp(color_a:Psg_color; color_b:Psg_color; amount:single):Tsg_color;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sg_color_lerp_precise(color_a:Psg_color; color_b:Psg_color; amount:single):Tsg_color;cdecl;external;
(* Const before type ignored *)
function sg_color_multiply(color:Psg_color; scale:single):Tsg_color;cdecl;external;
{
#define SG_ALICE_BLUE  0.941176471f, 0.97254902f, 1.0f, 1.0f 
#define SG_ANTIQUE_WHITE  0.980392157f, 0.921568627f, 0.843137255f, 1.0f 
#define SG_AQUA  0.0f, 1.0f, 1.0f, 1.0f 
#define SG_AQUAMARINE  0.498039216f, 1.0f, 0.831372549f, 1.0f 
#define SG_AZURE  0.941176471f, 1.0f, 1.0f, 1.0f 
#define SG_BEIGE  0.960784314f, 0.960784314f, 0.862745098f, 1.0f 
#define SG_BISQUE  1.0f, 0.894117647f, 0.768627451f, 1.0f 
#define SG_BLACK  0.0f, 0.0f, 0.0f, 1.0f 
#define SG_BLANCHED_ALMOND  1.0f, 0.921568627f, 0.803921569f, 1.0f 
#define SG_BLUE  0.0f, 0.0f, 1.0f, 1.0f 
#define SG_BLUE_VIOLET  0.541176471f, 0.168627451f, 0.88627451f, 1.0f 
#define SG_BROWN  0.647058824f, 0.164705882f, 0.164705882f, 1.0f 
#define SG_BURLYWOOD  0.870588235f, 0.721568627f, 0.529411765f, 1.0f 
#define SG_CADET_BLUE  0.37254902f, 0.619607843f, 0.62745098f, 1.0f 
#define SG_CHARTREUSE  0.498039216f, 1.0f, 0.0f, 1.0f 
#define SG_CHOCOLATE  0.823529412f, 0.411764706f, 0.117647059f, 1.0f 
#define SG_CORAL  1.0f, 0.498039216f, 0.31372549f, 1.0f 
#define SG_CORNFLOWER_BLUE  0.392156863f, 0.584313725f, 0.929411765f, 1.0f 
#define SG_CORNSILK  1.0f, 0.97254902f, 0.862745098f, 1.0f 
#define SG_CRIMSON  0.862745098f, 0.0784313725f, 0.235294118f, 1.0f 
#define SG_CYAN  0.0f, 1.0f, 1.0f, 1.0f 
#define SG_DARK_BLUE  0.0f, 0.0f, 0.545098039f, 1.0f 
#define SG_DARK_CYAN  0.0f, 0.545098039f, 0.545098039f, 1.0f 
#define SG_DARK_GOLDENROD  0.721568627f, 0.525490196f, 0.0431372549f, 1.0f 
#define SG_DARK_GRAY  0.662745098f, 0.662745098f, 0.662745098f, 1.0f 
#define SG_DARK_GREEN  0.0f, 0.392156863f, 0.0f, 1.0f 
#define SG_DARK_KHAKI  0.741176471f, 0.717647059f, 0.419607843f, 1.0f 
#define SG_DARK_MAGENTA  0.545098039f, 0.0f, 0.545098039f, 1.0f 
#define SG_DARK_OLIVE_GREEN  0.333333333f, 0.419607843f, 0.184313725f, 1.0f 
#define SG_DARK_ORANGE  1.0f, 0.549019608f, 0.0f, 1.0f 
#define SG_DARK_ORCHID  0.6f, 0.196078431f, 0.8f, 1.0f 
#define SG_DARK_RED  0.545098039f, 0.0f, 0.0f, 1.0f 
#define SG_DARK_SALMON  0.91372549f, 0.588235294f, 0.478431373f, 1.0f 
#define SG_DARK_SEA_GREEN  0.560784314f, 0.737254902f, 0.560784314f, 1.0f 
#define SG_DARK_SLATE_BLUE  0.282352941f, 0.239215686f, 0.545098039f, 1.0f 
#define SG_DARK_SLATE_GRAY  0.184313725f, 0.309803922f, 0.309803922f, 1.0f 
#define SG_DARK_TURQUOISE  0.0f, 0.807843137f, 0.819607843f, 1.0f 
#define SG_DARK_VIOLET  0.580392157f, 0.0f, 0.82745098f, 1.0f 
#define SG_DEEP_PINK  1.0f, 0.0784313725f, 0.576470588f, 1.0f 
#define SG_DEEP_SKY_BLUE  0.0f, 0.749019608f, 1.0f, 1.0f 
#define SG_DIM_GRAY  0.411764706f, 0.411764706f, 0.411764706f, 1.0f 
#define SG_DODGER_BLUE  0.117647059f, 0.564705882f, 1.0f, 1.0f 
#define SG_FIREBRICK  0.698039216f, 0.133333333f, 0.133333333f, 1.0f 
#define SG_FLORAL_WHITE  1.0f, 0.980392157f, 0.941176471f, 1.0f 
#define SG_FOREST_GREEN  0.133333333f, 0.545098039f, 0.133333333f, 1.0f 
#define SG_FUCHSIA  1.0f, 0.0f, 1.0f, 1.0f 
#define SG_GAINSBORO  0.862745098f, 0.862745098f, 0.862745098f, 1.0f 
#define SG_GHOST_WHITE  0.97254902f, 0.97254902f, 1.0f, 1.0f 
#define SG_GOLD  1.0f, 0.843137255f, 0.0f, 1.0f 
#define SG_GOLDENROD  0.854901961f, 0.647058824f, 0.125490196f, 1.0f 
#define SG_GRAY  0.745098039f, 0.745098039f, 0.745098039f, 1.0f 
#define SG_WEB_GRAY  0.501960784f, 0.501960784f, 0.501960784f, 1.0f 
#define SG_GREEN  0.0f, 1.0f, 0.0f, 1.0f 
#define SG_WEB_GREEN  0.0f, 0.501960784f, 0.0f, 1.0f 
#define SG_GREEN_YELLOW  0.678431373f, 1.0f, 0.184313725f, 1.0f 
#define SG_HONEYDEW  0.941176471f, 1.0f, 0.941176471f, 1.0f 
#define SG_HOT_PINK  1.0f, 0.411764706f, 0.705882353f, 1.0f 
#define SG_INDIAN_RED  0.803921569f, 0.360784314f, 0.360784314f, 1.0f 
#define SG_INDIGO  0.294117647f, 0.0f, 0.509803922f, 1.0f 
#define SG_IVORY  1.0f, 1.0f, 0.941176471f, 1.0f 
#define SG_KHAKI  0.941176471f, 0.901960784f, 0.549019608f, 1.0f 
#define SG_LAVENDER  0.901960784f, 0.901960784f, 0.980392157f, 1.0f 
#define SG_LAVENDER_BLUSH  1.0f, 0.941176471f, 0.960784314f, 1.0f 
#define SG_LAWN_GREEN  0.48627451f, 0.988235294f, 0.0f, 1.0f 
#define SG_LEMON_CHIFFON  1.0f, 0.980392157f, 0.803921569f, 1.0f 
#define SG_LIGHT_BLUE  0.678431373f, 0.847058824f, 0.901960784f, 1.0f 
#define SG_LIGHT_CORAL  0.941176471f, 0.501960784f, 0.501960784f, 1.0f 
#define SG_LIGHT_CYAN  0.878431373f, 1.0f, 1.0f, 1.0f 
#define SG_LIGHT_GOLDENROD  0.980392157f, 0.980392157f, 0.823529412f, 1.0f 
#define SG_LIGHT_GRAY  0.82745098f, 0.82745098f, 0.82745098f, 1.0f 
#define SG_LIGHT_GREEN  0.564705882f, 0.933333333f, 0.564705882f, 1.0f 
#define SG_LIGHT_PINK  1.0f, 0.71372549f, 0.756862745f, 1.0f 
#define SG_LIGHT_SALMON  1.0f, 0.62745098f, 0.478431373f, 1.0f 
#define SG_LIGHT_SEA_GREEN  0.125490196f, 0.698039216f, 0.666666667f, 1.0f 
#define SG_LIGHT_SKY_BLUE  0.529411765f, 0.807843137f, 0.980392157f, 1.0f 
#define SG_LIGHT_SLATE_GRAY  0.466666667f, 0.533333333f, 0.6f, 1.0f 
#define SG_LIGHT_STEEL_BLUE  0.690196078f, 0.768627451f, 0.870588235f, 1.0f 
#define SG_LIGHT_YELLOW  1.0f, 1.0f, 0.878431373f, 1.0f 
#define SG_LIME  0.0f, 1.0f, 0.0f, 1.0f 
#define SG_LIME_GREEN  0.196078431f, 0.803921569f, 0.196078431f, 1.0f 
#define SG_LINEN  0.980392157f, 0.941176471f, 0.901960784f, 1.0f 
#define SG_MAGENTA  1.0f, 0.0f, 1.0f, 1.0f 
#define SG_MAROON  0.690196078f, 0.188235294f, 0.376470588f, 1.0f 
#define SG_WEB_MAROON  0.501960784f, 0.0f, 0.0f, 1.0f 
#define SG_MEDIUM_AQUAMARINE  0.4f, 0.803921569f, 0.666666667f, 1.0f 
#define SG_MEDIUM_BLUE  0.0f, 0.0f, 0.803921569f, 1.0f 
#define SG_MEDIUM_ORCHID  0.729411765f, 0.333333333f, 0.82745098f, 1.0f 
#define SG_MEDIUM_PURPLE  0.576470588f, 0.439215686f, 0.858823529f, 1.0f 
#define SG_MEDIUM_SEA_GREEN  0.235294118f, 0.701960784f, 0.443137255f, 1.0f 
#define SG_MEDIUM_SLATE_BLUE  0.482352941f, 0.407843137f, 0.933333333f, 1.0f 
#define SG_MEDIUM_SPRING_GREEN  0.0f, 0.980392157f, 0.603921569f, 1.0f 
#define SG_MEDIUM_TURQUOISE  0.282352941f, 0.819607843f, 0.8f, 1.0f 
#define SG_MEDIUM_VIOLET_RED  0.780392157f, 0.0823529412f, 0.521568627f, 1.0f 
#define SG_MIDNIGHT_BLUE  0.0980392157f, 0.0980392157f, 0.439215686f, 1.0f 
#define SG_MINT_CREAM  0.960784314f, 1.0f, 0.980392157f, 1.0f 
#define SG_MISTY_ROSE  1.0f, 0.894117647f, 0.882352941f, 1.0f 
#define SG_MOCCASIN  1.0f, 0.894117647f, 0.709803922f, 1.0f 
#define SG_NAVAJO_WHITE  1.0f, 0.870588235f, 0.678431373f, 1.0f 
#define SG_NAVY_BLUE  0.0f, 0.0f, 0.501960784f, 1.0f 
#define SG_OLD_LACE  0.992156863f, 0.960784314f, 0.901960784f, 1.0f 
#define SG_OLIVE  0.501960784f, 0.501960784f, 0.0f, 1.0f 
#define SG_OLIVE_DRAB  0.419607843f, 0.556862745f, 0.137254902f, 1.0f 
#define SG_ORANGE  1.0f, 0.647058824f, 0.0f, 1.0f 
#define SG_ORANGE_RED  1.0f, 0.270588235f, 0.0f, 1.0f 
#define SG_ORCHID  0.854901961f, 0.439215686f, 0.839215686f, 1.0f 
#define SG_PALE_GOLDENROD  0.933333333f, 0.909803922f, 0.666666667f, 1.0f 
#define SG_PALE_GREEN  0.596078431f, 0.984313725f, 0.596078431f, 1.0f 
#define SG_PALE_TURQUOISE  0.68627451f, 0.933333333f, 0.933333333f, 1.0f 
#define SG_PALE_VIOLET_RED  0.858823529f, 0.439215686f, 0.576470588f, 1.0f 
#define SG_PAPAYA_WHIP  1.0f, 0.937254902f, 0.835294118f, 1.0f 
#define SG_PEACH_PUFF  1.0f, 0.854901961f, 0.725490196f, 1.0f 
#define SG_PERU  0.803921569f, 0.521568627f, 0.247058824f, 1.0f 
#define SG_PINK  1.0f, 0.752941176f, 0.796078431f, 1.0f 
#define SG_PLUM  0.866666667f, 0.62745098f, 0.866666667f, 1.0f 
#define SG_POWDER_BLUE  0.690196078f, 0.878431373f, 0.901960784f, 1.0f 
#define SG_PURPLE  0.62745098f, 0.125490196f, 0.941176471f, 1.0f 
#define SG_WEB_PURPLE  0.501960784f, 0.0f, 0.501960784f, 1.0f 
#define SG_REBECCA_PURPLE  0.4f, 0.2f, 0.6f, 1.0f 
#define SG_RED  1.0f, 0.0f, 0.0f, 1.0f 
#define SG_ROSY_BROWN  0.737254902f, 0.560784314f, 0.560784314f, 1.0f 
#define SG_ROYAL_BLUE  0.254901961f, 0.411764706f, 0.882352941f, 1.0f 
#define SG_SADDLE_BROWN  0.545098039f, 0.270588235f, 0.0745098039f, 1.0f 
#define SG_SALMON  0.980392157f, 0.501960784f, 0.447058824f, 1.0f 
#define SG_SANDY_BROWN  0.956862745f, 0.643137255f, 0.376470588f, 1.0f 
#define SG_SEA_GREEN  0.180392157f, 0.545098039f, 0.341176471f, 1.0f 
#define SG_SEASHELL  1.0f, 0.960784314f, 0.933333333f, 1.0f 
#define SG_SIENNA  0.62745098f, 0.321568627f, 0.176470588f, 1.0f 
#define SG_SILVER  0.752941176f, 0.752941176f, 0.752941176f, 1.0f 
#define SG_SKY_BLUE  0.529411765f, 0.807843137f, 0.921568627f, 1.0f 
#define SG_SLATE_BLUE  0.415686275f, 0.352941176f, 0.803921569f, 1.0f 
#define SG_SLATE_GRAY  0.439215686f, 0.501960784f, 0.564705882f, 1.0f 
#define SG_SNOW  1.0f, 0.980392157f, 0.980392157f, 1.0f 
#define SG_SPRING_GREEN  0.0f, 1.0f, 0.498039216f, 1.0f 
#define SG_STEEL_BLUE  0.274509804f, 0.509803922f, 0.705882353f, 1.0f 
#define SG_TAN  0.823529412f, 0.705882353f, 0.549019608f, 1.0f 
#define SG_TEAL  0.0f, 0.501960784f, 0.501960784f, 1.0f 
#define SG_THISTLE  0.847058824f, 0.749019608f, 0.847058824f, 1.0f 
#define SG_TOMATO  1.0f, 0.388235294f, 0.278431373f, 1.0f 
#define SG_TRANSPARENT  0.0f, 0.0f, 0.0f, 0.0f 
#define SG_TURQUOISE  0.250980392f, 0.878431373f, 0.815686275f, 1.0f 
#define SG_VIOLET  0.933333333f, 0.509803922f, 0.933333333f, 1.0f 
#define SG_WHEAT  0.960784314f, 0.870588235f, 0.701960784f, 1.0f 
#define SG_WHITE  1.0f, 1.0f, 1.0f, 1.0f 
#define SG_WHITE_SMOKE  0.960784314f, 0.960784314f, 0.960784314f, 1.0f 
#define SG_YELLOW  1.0f, 1.0f, 0.0f, 1.0f 
#define SG_YELLOW_GREEN  0.603921569f, 0.803921569f, 0.196078431f, 1.0f 

static const sg_color sg_alice_blue = SG_ALICE_BLUE;
static const sg_color sg_antique_white = SG_ANTIQUE_WHITE;
static const sg_color sg_aqua = SG_AQUA;
static const sg_color sg_aquamarine = SG_AQUAMARINE;
static const sg_color sg_azure = SG_AZURE;
static const sg_color sg_beige = SG_BEIGE;
static const sg_color sg_bisque = SG_BISQUE;
static const sg_color sg_black = SG_BLACK;
static const sg_color sg_blanched_almond = SG_BLANCHED_ALMOND;
static const sg_color sg_blue = SG_BLUE;
static const sg_color sg_blue_violet = SG_BLUE_VIOLET;
static const sg_color sg_brown = SG_BROWN;
static const sg_color sg_burlywood = SG_BURLYWOOD;
static const sg_color sg_cadet_blue = SG_CADET_BLUE;
static const sg_color sg_chartreuse = SG_CHARTREUSE;
static const sg_color sg_chocolate = SG_CHOCOLATE;
static const sg_color sg_coral = SG_CORAL;
static const sg_color sg_cornflower_blue = SG_CORNFLOWER_BLUE;
static const sg_color sg_cornsilk = SG_CORNSILK;
static const sg_color sg_crimson = SG_CRIMSON;
static const sg_color sg_cyan = SG_CYAN;
static const sg_color sg_dark_blue = SG_DARK_BLUE;
static const sg_color sg_dark_cyan = SG_DARK_CYAN;
static const sg_color sg_dark_goldenrod = SG_DARK_GOLDENROD;
static const sg_color sg_dark_gray = SG_DARK_GRAY;
static const sg_color sg_dark_green = SG_DARK_GREEN;
static const sg_color sg_dark_khaki = SG_DARK_KHAKI;
static const sg_color sg_dark_magenta = SG_DARK_MAGENTA;
static const sg_color sg_dark_olive_green = SG_DARK_OLIVE_GREEN;
static const sg_color sg_dark_orange = SG_DARK_ORANGE;
static const sg_color sg_dark_orchid = SG_DARK_ORCHID;
static const sg_color sg_dark_red = SG_DARK_RED;
static const sg_color sg_dark_salmon = SG_DARK_SALMON;
static const sg_color sg_dark_sea_green = SG_DARK_SEA_GREEN;
static const sg_color sg_dark_slate_blue = SG_DARK_SLATE_BLUE;
static const sg_color sg_dark_slate_gray = SG_DARK_SLATE_GRAY;
static const sg_color sg_dark_turquoise = SG_DARK_TURQUOISE;
static const sg_color sg_dark_violet = SG_DARK_VIOLET;
static const sg_color sg_deep_pink = SG_DEEP_PINK;
static const sg_color sg_deep_sky_blue = SG_DEEP_SKY_BLUE;
static const sg_color sg_dim_gray = SG_DIM_GRAY;
static const sg_color sg_dodger_blue = SG_DODGER_BLUE;
static const sg_color sg_firebrick = SG_FIREBRICK;
static const sg_color sg_floral_white = SG_FLORAL_WHITE;
static const sg_color sg_forest_green = SG_FOREST_GREEN;
static const sg_color sg_fuchsia = SG_FUCHSIA;
static const sg_color sg_gainsboro = SG_GAINSBORO;
static const sg_color sg_ghost_white = SG_GHOST_WHITE;
static const sg_color sg_gold = SG_GOLD;
static const sg_color sg_goldenrod = SG_GOLDENROD;
static const sg_color sg_gray = SG_GRAY;
static const sg_color sg_web_gray = SG_WEB_GRAY;
static const sg_color sg_green = SG_GREEN;
static const sg_color sg_web_green = SG_WEB_GREEN;
static const sg_color sg_green_yellow = SG_GREEN_YELLOW;
static const sg_color sg_honeydew = SG_HONEYDEW;
static const sg_color sg_hot_pink = SG_HOT_PINK;
static const sg_color sg_indian_red = SG_INDIAN_RED;
static const sg_color sg_indigo = SG_INDIGO;
static const sg_color sg_ivory = SG_IVORY;
static const sg_color sg_khaki = SG_KHAKI;
static const sg_color sg_lavender = SG_LAVENDER;
static const sg_color sg_lavender_blush = SG_LAVENDER_BLUSH;
static const sg_color sg_lawn_green = SG_LAWN_GREEN;
static const sg_color sg_lemon_chiffon = SG_LEMON_CHIFFON;
static const sg_color sg_light_blue = SG_LIGHT_BLUE;
static const sg_color sg_light_coral = SG_LIGHT_CORAL;
static const sg_color sg_light_cyan = SG_LIGHT_CYAN;
static const sg_color sg_light_goldenrod = SG_LIGHT_GOLDENROD;
static const sg_color sg_light_gray = SG_LIGHT_GRAY;
static const sg_color sg_light_green = SG_LIGHT_GREEN;
static const sg_color sg_light_pink = SG_LIGHT_PINK;
static const sg_color sg_light_salmon = SG_LIGHT_SALMON;
static const sg_color sg_light_sea_green = SG_LIGHT_SEA_GREEN;
static const sg_color sg_light_sky_blue = SG_LIGHT_SKY_BLUE;
static const sg_color sg_light_slate_gray = SG_LIGHT_SLATE_GRAY;
static const sg_color sg_light_steel_blue = SG_LIGHT_STEEL_BLUE;
static const sg_color sg_light_yellow = SG_LIGHT_YELLOW;
static const sg_color sg_lime = SG_LIME;
static const sg_color sg_lime_green = SG_LIME_GREEN;
static const sg_color sg_linen = SG_LINEN;
static const sg_color sg_magenta = SG_MAGENTA;
static const sg_color sg_maroon = SG_MAROON;
static const sg_color sg_web_maroon = SG_WEB_MAROON;
static const sg_color sg_medium_aquamarine = SG_MEDIUM_AQUAMARINE;
static const sg_color sg_medium_blue = SG_MEDIUM_BLUE;
static const sg_color sg_medium_orchid = SG_MEDIUM_ORCHID;
static const sg_color sg_medium_purple = SG_MEDIUM_PURPLE;
static const sg_color sg_medium_sea_green = SG_MEDIUM_SEA_GREEN;
static const sg_color sg_medium_slate_blue = SG_MEDIUM_SLATE_BLUE;
static const sg_color sg_medium_spring_green = SG_MEDIUM_SPRING_GREEN;
static const sg_color sg_medium_turquoise = SG_MEDIUM_TURQUOISE;
static const sg_color sg_medium_violet_red = SG_MEDIUM_VIOLET_RED;
static const sg_color sg_midnight_blue = SG_MIDNIGHT_BLUE;
static const sg_color sg_mint_cream = SG_MINT_CREAM;
static const sg_color sg_misty_rose = SG_MISTY_ROSE;
static const sg_color sg_moccasin = SG_MOCCASIN;
static const sg_color sg_navajo_white = SG_NAVAJO_WHITE;
static const sg_color sg_navy_blue = SG_NAVY_BLUE;
static const sg_color sg_old_lace = SG_OLD_LACE;
static const sg_color sg_olive = SG_OLIVE;
static const sg_color sg_olive_drab = SG_OLIVE_DRAB;
static const sg_color sg_orange = SG_ORANGE;
static const sg_color sg_orange_red = SG_ORANGE_RED;
static const sg_color sg_orchid = SG_ORCHID;
static const sg_color sg_pale_goldenrod = SG_PALE_GOLDENROD;
static const sg_color sg_pale_green = SG_PALE_GREEN;
static const sg_color sg_pale_turquoise = SG_PALE_TURQUOISE;
static const sg_color sg_pale_violet_red = SG_PALE_VIOLET_RED;
static const sg_color sg_papaya_whip = SG_PAPAYA_WHIP;
static const sg_color sg_peach_puff = SG_PEACH_PUFF;
static const sg_color sg_peru = SG_PERU;
static const sg_color sg_pink = SG_PINK;
static const sg_color sg_plum = SG_PLUM;
static const sg_color sg_powder_blue = SG_POWDER_BLUE;
static const sg_color sg_purple = SG_PURPLE;
static const sg_color sg_web_purple = SG_WEB_PURPLE;
static const sg_color sg_rebecca_purple = SG_REBECCA_PURPLE;
static const sg_color sg_red = SG_RED;
static const sg_color sg_rosy_brown = SG_ROSY_BROWN;
static const sg_color sg_royal_blue = SG_ROYAL_BLUE;
static const sg_color sg_saddle_brown = SG_SADDLE_BROWN;
static const sg_color sg_salmon = SG_SALMON;
static const sg_color sg_sandy_brown = SG_SANDY_BROWN;
static const sg_color sg_sea_green = SG_SEA_GREEN;
static const sg_color sg_seashell = SG_SEASHELL;
static const sg_color sg_sienna = SG_SIENNA;
static const sg_color sg_silver = SG_SILVER;
static const sg_color sg_sky_blue = SG_SKY_BLUE;
static const sg_color sg_slate_blue = SG_SLATE_BLUE;
static const sg_color sg_slate_gray = SG_SLATE_GRAY;
static const sg_color sg_snow = SG_SNOW;
static const sg_color sg_spring_green = SG_SPRING_GREEN;
static const sg_color sg_steel_blue = SG_STEEL_BLUE;
static const sg_color sg_tan = SG_TAN;
static const sg_color sg_teal = SG_TEAL;
static const sg_color sg_thistle = SG_THISTLE;
static const sg_color sg_tomato = SG_TOMATO;
static const sg_color sg_transparent = SG_TRANSPARENT;
static const sg_color sg_turquoise = SG_TURQUOISE;
static const sg_color sg_violet = SG_VIOLET;
static const sg_color sg_wheat = SG_WHEAT;
static const sg_color sg_white = SG_WHITE;
static const sg_color sg_white_smoke = SG_WHITE_SMOKE;
static const sg_color sg_yellow = SG_YELLOW;
static const sg_color sg_yellow_green = SG_YELLOW_GREEN;
 }
const
  SG_ALICE_BLUE_RGBA32 = $F0F8FFFF;  
  SG_ANTIQUE_WHITE_RGBA32 = $FAEBD7FF;  
  SG_AQUA_RGBA32 = $00FFFFFF;  
  SG_AQUAMARINE_RGBA32 = $7FFFD4FF;  
  SG_AZURE_RGBA32 = $F0FFFFFF;  
  SG_BEIGE_RGBA32 = $F5F5DCFF;  
  SG_BISQUE_RGBA32 = $FFE4C4FF;  
  SG_BLACK_RGBA32 = $000000FF;  
  SG_BLANCHED_ALMOND_RGBA32 = $FFEBCDFF;  
  SG_BLUE_RGBA32 = $0000FFFF;  
  SG_BLUE_VIOLET_RGBA32 = $8A2BE2FF;  
  SG_BROWN_RGBA32 = $A52A2AFF;  
  SG_BURLYWOOD_RGBA32 = $DEB887FF;  
  SG_CADET_BLUE_RGBA32 = $5F9EA0FF;  
  SG_CHARTREUSE_RGBA32 = $7FFF00FF;  
  SG_CHOCOLATE_RGBA32 = $D2691EFF;  
  SG_CORAL_RGBA32 = $FF7F50FF;  
  SG_CORNFLOWER_BLUE_RGBA32 = $6495EDFF;  
  SG_CORNSILK_RGBA32 = $FFF8DCFF;  
  SG_CRIMSON_RGBA32 = $DC143CFF;  
  SG_CYAN_RGBA32 = $00FFFFFF;  
  SG_DARK_BLUE_RGBA32 = $00008BFF;  
  SG_DARK_CYAN_RGBA32 = $008B8BFF;  
  SG_DARK_GOLDENROD_RGBA32 = $B8860BFF;  
  SG_DARK_GRAY_RGBA32 = $A9A9A9FF;  
  SG_DARK_GREEN_RGBA32 = $006400FF;  
  SG_DARK_KHAKI_RGBA32 = $BDB76BFF;  
  SG_DARK_MAGENTA_RGBA32 = $8B008BFF;  
  SG_DARK_OLIVE_GREEN_RGBA32 = $556B2FFF;  
  SG_DARK_ORANGE_RGBA32 = $FF8C00FF;  
  SG_DARK_ORCHID_RGBA32 = $9932CCFF;  
  SG_DARK_RED_RGBA32 = $8B0000FF;  
  SG_DARK_SALMON_RGBA32 = $E9967AFF;  
  SG_DARK_SEA_GREEN_RGBA32 = $8FBC8FFF;  
  SG_DARK_SLATE_BLUE_RGBA32 = $483D8BFF;  
  SG_DARK_SLATE_GRAY_RGBA32 = $2F4F4FFF;  
  SG_DARK_TURQUOISE_RGBA32 = $00CED1FF;  
  SG_DARK_VIOLET_RGBA32 = $9400D3FF;  
  SG_DEEP_PINK_RGBA32 = $FF1493FF;  
  SG_DEEP_SKY_BLUE_RGBA32 = $00BFFFFF;  
  SG_DIM_GRAY_RGBA32 = $696969FF;  
  SG_DODGER_BLUE_RGBA32 = $1E90FFFF;  
  SG_FIREBRICK_RGBA32 = $B22222FF;  
  SG_FLORAL_WHITE_RGBA32 = $FFFAF0FF;  
  SG_FOREST_GREEN_RGBA32 = $228B22FF;  
  SG_FUCHSIA_RGBA32 = $FF00FFFF;  
  SG_GAINSBORO_RGBA32 = $DCDCDCFF;  
  SG_GHOST_WHITE_RGBA32 = $F8F8FFFF;  
  SG_GOLD_RGBA32 = $FFD700FF;  
  SG_GOLDENROD_RGBA32 = $DAA520FF;  
  SG_GRAY_RGBA32 = $BEBEBEFF;  
  SG_WEB_GRAY_RGBA32 = $808080FF;  
  SG_GREEN_RGBA32 = $00FF00FF;  
  SG_WEB_GREEN_RGBA32 = $008000FF;  
  SG_GREEN_YELLOW_RGBA32 = $ADFF2FFF;  
  SG_HONEYDEW_RGBA32 = $F0FFF0FF;  
  SG_HOT_PINK_RGBA32 = $FF69B4FF;  
  SG_INDIAN_RED_RGBA32 = $CD5C5CFF;  
  SG_INDIGO_RGBA32 = $4B0082FF;  
  SG_IVORY_RGBA32 = $FFFFF0FF;  
  SG_KHAKI_RGBA32 = $F0E68CFF;  
  SG_LAVENDER_RGBA32 = $E6E6FAFF;  
  SG_LAVENDER_BLUSH_RGBA32 = $FFF0F5FF;  
  SG_LAWN_GREEN_RGBA32 = $7CFC00FF;  
  SG_LEMON_CHIFFON_RGBA32 = $FFFACDFF;  
  SG_LIGHT_BLUE_RGBA32 = $ADD8E6FF;  
  SG_LIGHT_CORAL_RGBA32 = $F08080FF;  
  SG_LIGHT_CYAN_RGBA32 = $E0FFFFFF;  
  SG_LIGHT_GOLDENROD_RGBA32 = $FAFAD2FF;  
  SG_LIGHT_GRAY_RGBA32 = $D3D3D3FF;  
  SG_LIGHT_GREEN_RGBA32 = $90EE90FF;  
  SG_LIGHT_PINK_RGBA32 = $FFB6C1FF;  
  SG_LIGHT_SALMON_RGBA32 = $FFA07AFF;  
  SG_LIGHT_SEA_GREEN_RGBA32 = $20B2AAFF;  
  SG_LIGHT_SKY_BLUE_RGBA32 = $87CEFAFF;  
  SG_LIGHT_SLATE_GRAY_RGBA32 = $778899FF;  
  SG_LIGHT_STEEL_BLUE_RGBA32 = $B0C4DEFF;  
  SG_LIGHT_YELLOW_RGBA32 = $FFFFE0FF;  
  SG_LIME_RGBA32 = $00FF00FF;  
  SG_LIME_GREEN_RGBA32 = $32CD32FF;  
  SG_LINEN_RGBA32 = $FAF0E6FF;  
  SG_MAGENTA_RGBA32 = $FF00FFFF;  
  SG_MAROON_RGBA32 = $B03060FF;  
  SG_WEB_MAROON_RGBA32 = $800000FF;  
  SG_MEDIUM_AQUAMARINE_RGBA32 = $66CDAAFF;  
  SG_MEDIUM_BLUE_RGBA32 = $0000CDFF;  
  SG_MEDIUM_ORCHID_RGBA32 = $BA55D3FF;  
  SG_MEDIUM_PURPLE_RGBA32 = $9370DBFF;  
  SG_MEDIUM_SEA_GREEN_RGBA32 = $3CB371FF;  
  SG_MEDIUM_SLATE_BLUE_RGBA32 = $7B68EEFF;  
  SG_MEDIUM_SPRING_GREEN_RGBA32 = $00FA9AFF;  
  SG_MEDIUM_TURQUOISE_RGBA32 = $48D1CCFF;  
  SG_MEDIUM_VIOLET_RED_RGBA32 = $C71585FF;  
  SG_MIDNIGHT_BLUE_RGBA32 = $191970FF;  
  SG_MINT_CREAM_RGBA32 = $F5FFFAFF;  
  SG_MISTY_ROSE_RGBA32 = $FFE4E1FF;  
  SG_MOCCASIN_RGBA32 = $FFE4B5FF;  
  SG_NAVAJO_WHITE_RGBA32 = $FFDEADFF;  
  SG_NAVY_BLUE_RGBA32 = $000080FF;  
  SG_OLD_LACE_RGBA32 = $FDF5E6FF;  
  SG_OLIVE_RGBA32 = $808000FF;  
  SG_OLIVE_DRAB_RGBA32 = $6B8E23FF;  
  SG_ORANGE_RGBA32 = $FFA500FF;  
  SG_ORANGE_RED_RGBA32 = $FF4500FF;  
  SG_ORCHID_RGBA32 = $DA70D6FF;  
  SG_PALE_GOLDENROD_RGBA32 = $EEE8AAFF;  
  SG_PALE_GREEN_RGBA32 = $98FB98FF;  
  SG_PALE_TURQUOISE_RGBA32 = $AFEEEEFF;  
  SG_PALE_VIOLET_RED_RGBA32 = $DB7093FF;  
  SG_PAPAYA_WHIP_RGBA32 = $FFEFD5FF;  
  SG_PEACH_PUFF_RGBA32 = $FFDAB9FF;  
  SG_PERU_RGBA32 = $CD853FFF;  
  SG_PINK_RGBA32 = $FFC0CBFF;  
  SG_PLUM_RGBA32 = $DDA0DDFF;  
  SG_POWDER_BLUE_RGBA32 = $B0E0E6FF;  
  SG_PURPLE_RGBA32 = $A020F0FF;  
  SG_WEB_PURPLE_RGBA32 = $800080FF;  
  SG_REBECCA_PURPLE_RGBA32 = $663399FF;  
  SG_RED_RGBA32 = $FF0000FF;  
  SG_ROSY_BROWN_RGBA32 = $BC8F8FFF;  
  SG_ROYAL_BLUE_RGBA32 = $4169E1FF;  
  SG_SADDLE_BROWN_RGBA32 = $8B4513FF;  
  SG_SALMON_RGBA32 = $FA8072FF;  
  SG_SANDY_BROWN_RGBA32 = $F4A460FF;  
  SG_SEA_GREEN_RGBA32 = $2E8B57FF;  
  SG_SEASHELL_RGBA32 = $FFF5EEFF;  
  SG_SIENNA_RGBA32 = $A0522DFF;  
  SG_SILVER_RGBA32 = $C0C0C0FF;  
  SG_SKY_BLUE_RGBA32 = $87CEEBFF;  
  SG_SLATE_BLUE_RGBA32 = $6A5ACDFF;  
  SG_SLATE_GRAY_RGBA32 = $708090FF;  
  SG_SNOW_RGBA32 = $FFFAFAFF;  
  SG_SPRING_GREEN_RGBA32 = $00FF7FFF;  
  SG_STEEL_BLUE_RGBA32 = $4682B4FF;  
  SG_TAN_RGBA32 = $D2B48CFF;  
  SG_TEAL_RGBA32 = $008080FF;  
  SG_THISTLE_RGBA32 = $D8BFD8FF;  
  SG_TOMATO_RGBA32 = $FF6347FF;  
  SG_TRANSPARENT_RGBA32 = $00000000;  
  SG_TURQUOISE_RGBA32 = $40E0D0FF;  
  SG_VIOLET_RGBA32 = $EE82EEFF;  
  SG_WHEAT_RGBA32 = $F5DEB3FF;  
  SG_WHITE_RGBA32 = $FFFFFFFF;  
  SG_WHITE_SMOKE_RGBA32 = $F5F5F5FF;  
  SG_YELLOW_RGBA32 = $FFFF00FF;  
  SG_YELLOW_GREEN_RGBA32 = $9ACD32FF;  

implementation


end.
