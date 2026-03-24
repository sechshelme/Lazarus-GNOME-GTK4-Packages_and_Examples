
extern sg_color sg_make_color_4b(uint8_t r, uint8_t g, uint8_t b, uint8_t a);
extern sg_color sg_make_color_1i(uint32_t rgba);
extern sg_color sg_color_lerp(const sg_color* color_a, const sg_color* color_b, float amount);
extern sg_color sg_color_lerp_precise(const sg_color* color_a, const sg_color* color_b, float amount);
extern sg_color sg_color_multiply(const sg_color* color, float scale);

/*
#define SG_ALICE_BLUE { 0.941176471f, 0.97254902f, 1.0f, 1.0f }
#define SG_ANTIQUE_WHITE { 0.980392157f, 0.921568627f, 0.843137255f, 1.0f }
#define SG_AQUA { 0.0f, 1.0f, 1.0f, 1.0f }
#define SG_AQUAMARINE { 0.498039216f, 1.0f, 0.831372549f, 1.0f }
#define SG_AZURE { 0.941176471f, 1.0f, 1.0f, 1.0f }
#define SG_BEIGE { 0.960784314f, 0.960784314f, 0.862745098f, 1.0f }
#define SG_BISQUE { 1.0f, 0.894117647f, 0.768627451f, 1.0f }
#define SG_BLACK { 0.0f, 0.0f, 0.0f, 1.0f }
#define SG_BLANCHED_ALMOND { 1.0f, 0.921568627f, 0.803921569f, 1.0f }
#define SG_BLUE { 0.0f, 0.0f, 1.0f, 1.0f }
#define SG_BLUE_VIOLET { 0.541176471f, 0.168627451f, 0.88627451f, 1.0f }
#define SG_BROWN { 0.647058824f, 0.164705882f, 0.164705882f, 1.0f }
#define SG_BURLYWOOD { 0.870588235f, 0.721568627f, 0.529411765f, 1.0f }
#define SG_CADET_BLUE { 0.37254902f, 0.619607843f, 0.62745098f, 1.0f }
#define SG_CHARTREUSE { 0.498039216f, 1.0f, 0.0f, 1.0f }
#define SG_CHOCOLATE { 0.823529412f, 0.411764706f, 0.117647059f, 1.0f }
#define SG_CORAL { 1.0f, 0.498039216f, 0.31372549f, 1.0f }
#define SG_CORNFLOWER_BLUE { 0.392156863f, 0.584313725f, 0.929411765f, 1.0f }
#define SG_CORNSILK { 1.0f, 0.97254902f, 0.862745098f, 1.0f }
#define SG_CRIMSON { 0.862745098f, 0.0784313725f, 0.235294118f, 1.0f }
#define SG_CYAN { 0.0f, 1.0f, 1.0f, 1.0f }
#define SG_DARK_BLUE { 0.0f, 0.0f, 0.545098039f, 1.0f }
#define SG_DARK_CYAN { 0.0f, 0.545098039f, 0.545098039f, 1.0f }
#define SG_DARK_GOLDENROD { 0.721568627f, 0.525490196f, 0.0431372549f, 1.0f }
#define SG_DARK_GRAY { 0.662745098f, 0.662745098f, 0.662745098f, 1.0f }
#define SG_DARK_GREEN { 0.0f, 0.392156863f, 0.0f, 1.0f }
#define SG_DARK_KHAKI { 0.741176471f, 0.717647059f, 0.419607843f, 1.0f }
#define SG_DARK_MAGENTA { 0.545098039f, 0.0f, 0.545098039f, 1.0f }
#define SG_DARK_OLIVE_GREEN { 0.333333333f, 0.419607843f, 0.184313725f, 1.0f }
#define SG_DARK_ORANGE { 1.0f, 0.549019608f, 0.0f, 1.0f }
#define SG_DARK_ORCHID { 0.6f, 0.196078431f, 0.8f, 1.0f }
#define SG_DARK_RED { 0.545098039f, 0.0f, 0.0f, 1.0f }
#define SG_DARK_SALMON { 0.91372549f, 0.588235294f, 0.478431373f, 1.0f }
#define SG_DARK_SEA_GREEN { 0.560784314f, 0.737254902f, 0.560784314f, 1.0f }
#define SG_DARK_SLATE_BLUE { 0.282352941f, 0.239215686f, 0.545098039f, 1.0f }
#define SG_DARK_SLATE_GRAY { 0.184313725f, 0.309803922f, 0.309803922f, 1.0f }
#define SG_DARK_TURQUOISE { 0.0f, 0.807843137f, 0.819607843f, 1.0f }
#define SG_DARK_VIOLET { 0.580392157f, 0.0f, 0.82745098f, 1.0f }
#define SG_DEEP_PINK { 1.0f, 0.0784313725f, 0.576470588f, 1.0f }
#define SG_DEEP_SKY_BLUE { 0.0f, 0.749019608f, 1.0f, 1.0f }
#define SG_DIM_GRAY { 0.411764706f, 0.411764706f, 0.411764706f, 1.0f }
#define SG_DODGER_BLUE { 0.117647059f, 0.564705882f, 1.0f, 1.0f }
#define SG_FIREBRICK { 0.698039216f, 0.133333333f, 0.133333333f, 1.0f }
#define SG_FLORAL_WHITE { 1.0f, 0.980392157f, 0.941176471f, 1.0f }
#define SG_FOREST_GREEN { 0.133333333f, 0.545098039f, 0.133333333f, 1.0f }
#define SG_FUCHSIA { 1.0f, 0.0f, 1.0f, 1.0f }
#define SG_GAINSBORO { 0.862745098f, 0.862745098f, 0.862745098f, 1.0f }
#define SG_GHOST_WHITE { 0.97254902f, 0.97254902f, 1.0f, 1.0f }
#define SG_GOLD { 1.0f, 0.843137255f, 0.0f, 1.0f }
#define SG_GOLDENROD { 0.854901961f, 0.647058824f, 0.125490196f, 1.0f }
#define SG_GRAY { 0.745098039f, 0.745098039f, 0.745098039f, 1.0f }
#define SG_WEB_GRAY { 0.501960784f, 0.501960784f, 0.501960784f, 1.0f }
#define SG_GREEN { 0.0f, 1.0f, 0.0f, 1.0f }
#define SG_WEB_GREEN { 0.0f, 0.501960784f, 0.0f, 1.0f }
#define SG_GREEN_YELLOW { 0.678431373f, 1.0f, 0.184313725f, 1.0f }
#define SG_HONEYDEW { 0.941176471f, 1.0f, 0.941176471f, 1.0f }
#define SG_HOT_PINK { 1.0f, 0.411764706f, 0.705882353f, 1.0f }
#define SG_INDIAN_RED { 0.803921569f, 0.360784314f, 0.360784314f, 1.0f }
#define SG_INDIGO { 0.294117647f, 0.0f, 0.509803922f, 1.0f }
#define SG_IVORY { 1.0f, 1.0f, 0.941176471f, 1.0f }
#define SG_KHAKI { 0.941176471f, 0.901960784f, 0.549019608f, 1.0f }
#define SG_LAVENDER { 0.901960784f, 0.901960784f, 0.980392157f, 1.0f }
#define SG_LAVENDER_BLUSH { 1.0f, 0.941176471f, 0.960784314f, 1.0f }
#define SG_LAWN_GREEN { 0.48627451f, 0.988235294f, 0.0f, 1.0f }
#define SG_LEMON_CHIFFON { 1.0f, 0.980392157f, 0.803921569f, 1.0f }
#define SG_LIGHT_BLUE { 0.678431373f, 0.847058824f, 0.901960784f, 1.0f }
#define SG_LIGHT_CORAL { 0.941176471f, 0.501960784f, 0.501960784f, 1.0f }
#define SG_LIGHT_CYAN { 0.878431373f, 1.0f, 1.0f, 1.0f }
#define SG_LIGHT_GOLDENROD { 0.980392157f, 0.980392157f, 0.823529412f, 1.0f }
#define SG_LIGHT_GRAY { 0.82745098f, 0.82745098f, 0.82745098f, 1.0f }
#define SG_LIGHT_GREEN { 0.564705882f, 0.933333333f, 0.564705882f, 1.0f }
#define SG_LIGHT_PINK { 1.0f, 0.71372549f, 0.756862745f, 1.0f }
#define SG_LIGHT_SALMON { 1.0f, 0.62745098f, 0.478431373f, 1.0f }
#define SG_LIGHT_SEA_GREEN { 0.125490196f, 0.698039216f, 0.666666667f, 1.0f }
#define SG_LIGHT_SKY_BLUE { 0.529411765f, 0.807843137f, 0.980392157f, 1.0f }
#define SG_LIGHT_SLATE_GRAY { 0.466666667f, 0.533333333f, 0.6f, 1.0f }
#define SG_LIGHT_STEEL_BLUE { 0.690196078f, 0.768627451f, 0.870588235f, 1.0f }
#define SG_LIGHT_YELLOW { 1.0f, 1.0f, 0.878431373f, 1.0f }
#define SG_LIME { 0.0f, 1.0f, 0.0f, 1.0f }
#define SG_LIME_GREEN { 0.196078431f, 0.803921569f, 0.196078431f, 1.0f }
#define SG_LINEN { 0.980392157f, 0.941176471f, 0.901960784f, 1.0f }
#define SG_MAGENTA { 1.0f, 0.0f, 1.0f, 1.0f }
#define SG_MAROON { 0.690196078f, 0.188235294f, 0.376470588f, 1.0f }
#define SG_WEB_MAROON { 0.501960784f, 0.0f, 0.0f, 1.0f }
#define SG_MEDIUM_AQUAMARINE { 0.4f, 0.803921569f, 0.666666667f, 1.0f }
#define SG_MEDIUM_BLUE { 0.0f, 0.0f, 0.803921569f, 1.0f }
#define SG_MEDIUM_ORCHID { 0.729411765f, 0.333333333f, 0.82745098f, 1.0f }
#define SG_MEDIUM_PURPLE { 0.576470588f, 0.439215686f, 0.858823529f, 1.0f }
#define SG_MEDIUM_SEA_GREEN { 0.235294118f, 0.701960784f, 0.443137255f, 1.0f }
#define SG_MEDIUM_SLATE_BLUE { 0.482352941f, 0.407843137f, 0.933333333f, 1.0f }
#define SG_MEDIUM_SPRING_GREEN { 0.0f, 0.980392157f, 0.603921569f, 1.0f }
#define SG_MEDIUM_TURQUOISE { 0.282352941f, 0.819607843f, 0.8f, 1.0f }
#define SG_MEDIUM_VIOLET_RED { 0.780392157f, 0.0823529412f, 0.521568627f, 1.0f }
#define SG_MIDNIGHT_BLUE { 0.0980392157f, 0.0980392157f, 0.439215686f, 1.0f }
#define SG_MINT_CREAM { 0.960784314f, 1.0f, 0.980392157f, 1.0f }
#define SG_MISTY_ROSE { 1.0f, 0.894117647f, 0.882352941f, 1.0f }
#define SG_MOCCASIN { 1.0f, 0.894117647f, 0.709803922f, 1.0f }
#define SG_NAVAJO_WHITE { 1.0f, 0.870588235f, 0.678431373f, 1.0f }
#define SG_NAVY_BLUE { 0.0f, 0.0f, 0.501960784f, 1.0f }
#define SG_OLD_LACE { 0.992156863f, 0.960784314f, 0.901960784f, 1.0f }
#define SG_OLIVE { 0.501960784f, 0.501960784f, 0.0f, 1.0f }
#define SG_OLIVE_DRAB { 0.419607843f, 0.556862745f, 0.137254902f, 1.0f }
#define SG_ORANGE { 1.0f, 0.647058824f, 0.0f, 1.0f }
#define SG_ORANGE_RED { 1.0f, 0.270588235f, 0.0f, 1.0f }
#define SG_ORCHID { 0.854901961f, 0.439215686f, 0.839215686f, 1.0f }
#define SG_PALE_GOLDENROD { 0.933333333f, 0.909803922f, 0.666666667f, 1.0f }
#define SG_PALE_GREEN { 0.596078431f, 0.984313725f, 0.596078431f, 1.0f }
#define SG_PALE_TURQUOISE { 0.68627451f, 0.933333333f, 0.933333333f, 1.0f }
#define SG_PALE_VIOLET_RED { 0.858823529f, 0.439215686f, 0.576470588f, 1.0f }
#define SG_PAPAYA_WHIP { 1.0f, 0.937254902f, 0.835294118f, 1.0f }
#define SG_PEACH_PUFF { 1.0f, 0.854901961f, 0.725490196f, 1.0f }
#define SG_PERU { 0.803921569f, 0.521568627f, 0.247058824f, 1.0f }
#define SG_PINK { 1.0f, 0.752941176f, 0.796078431f, 1.0f }
#define SG_PLUM { 0.866666667f, 0.62745098f, 0.866666667f, 1.0f }
#define SG_POWDER_BLUE { 0.690196078f, 0.878431373f, 0.901960784f, 1.0f }
#define SG_PURPLE { 0.62745098f, 0.125490196f, 0.941176471f, 1.0f }
#define SG_WEB_PURPLE { 0.501960784f, 0.0f, 0.501960784f, 1.0f }
#define SG_REBECCA_PURPLE { 0.4f, 0.2f, 0.6f, 1.0f }
#define SG_RED { 1.0f, 0.0f, 0.0f, 1.0f }
#define SG_ROSY_BROWN { 0.737254902f, 0.560784314f, 0.560784314f, 1.0f }
#define SG_ROYAL_BLUE { 0.254901961f, 0.411764706f, 0.882352941f, 1.0f }
#define SG_SADDLE_BROWN { 0.545098039f, 0.270588235f, 0.0745098039f, 1.0f }
#define SG_SALMON { 0.980392157f, 0.501960784f, 0.447058824f, 1.0f }
#define SG_SANDY_BROWN { 0.956862745f, 0.643137255f, 0.376470588f, 1.0f }
#define SG_SEA_GREEN { 0.180392157f, 0.545098039f, 0.341176471f, 1.0f }
#define SG_SEASHELL { 1.0f, 0.960784314f, 0.933333333f, 1.0f }
#define SG_SIENNA { 0.62745098f, 0.321568627f, 0.176470588f, 1.0f }
#define SG_SILVER { 0.752941176f, 0.752941176f, 0.752941176f, 1.0f }
#define SG_SKY_BLUE { 0.529411765f, 0.807843137f, 0.921568627f, 1.0f }
#define SG_SLATE_BLUE { 0.415686275f, 0.352941176f, 0.803921569f, 1.0f }
#define SG_SLATE_GRAY { 0.439215686f, 0.501960784f, 0.564705882f, 1.0f }
#define SG_SNOW { 1.0f, 0.980392157f, 0.980392157f, 1.0f }
#define SG_SPRING_GREEN { 0.0f, 1.0f, 0.498039216f, 1.0f }
#define SG_STEEL_BLUE { 0.274509804f, 0.509803922f, 0.705882353f, 1.0f }
#define SG_TAN { 0.823529412f, 0.705882353f, 0.549019608f, 1.0f }
#define SG_TEAL { 0.0f, 0.501960784f, 0.501960784f, 1.0f }
#define SG_THISTLE { 0.847058824f, 0.749019608f, 0.847058824f, 1.0f }
#define SG_TOMATO { 1.0f, 0.388235294f, 0.278431373f, 1.0f }
#define SG_TRANSPARENT { 0.0f, 0.0f, 0.0f, 0.0f }
#define SG_TURQUOISE { 0.250980392f, 0.878431373f, 0.815686275f, 1.0f }
#define SG_VIOLET { 0.933333333f, 0.509803922f, 0.933333333f, 1.0f }
#define SG_WHEAT { 0.960784314f, 0.870588235f, 0.701960784f, 1.0f }
#define SG_WHITE { 1.0f, 1.0f, 1.0f, 1.0f }
#define SG_WHITE_SMOKE { 0.960784314f, 0.960784314f, 0.960784314f, 1.0f }
#define SG_YELLOW { 1.0f, 1.0f, 0.0f, 1.0f }
#define SG_YELLOW_GREEN { 0.603921569f, 0.803921569f, 0.196078431f, 1.0f }

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
*/

#define SG_ALICE_BLUE_RGBA32 0xF0F8FFFF
#define SG_ANTIQUE_WHITE_RGBA32 0xFAEBD7FF
#define SG_AQUA_RGBA32 0x00FFFFFF
#define SG_AQUAMARINE_RGBA32 0x7FFFD4FF
#define SG_AZURE_RGBA32 0xF0FFFFFF
#define SG_BEIGE_RGBA32 0xF5F5DCFF
#define SG_BISQUE_RGBA32 0xFFE4C4FF
#define SG_BLACK_RGBA32 0x000000FF
#define SG_BLANCHED_ALMOND_RGBA32 0xFFEBCDFF
#define SG_BLUE_RGBA32 0x0000FFFF
#define SG_BLUE_VIOLET_RGBA32 0x8A2BE2FF
#define SG_BROWN_RGBA32 0xA52A2AFF
#define SG_BURLYWOOD_RGBA32 0xDEB887FF
#define SG_CADET_BLUE_RGBA32 0x5F9EA0FF
#define SG_CHARTREUSE_RGBA32 0x7FFF00FF
#define SG_CHOCOLATE_RGBA32 0xD2691EFF
#define SG_CORAL_RGBA32 0xFF7F50FF
#define SG_CORNFLOWER_BLUE_RGBA32 0x6495EDFF
#define SG_CORNSILK_RGBA32 0xFFF8DCFF
#define SG_CRIMSON_RGBA32 0xDC143CFF
#define SG_CYAN_RGBA32 0x00FFFFFF
#define SG_DARK_BLUE_RGBA32 0x00008BFF
#define SG_DARK_CYAN_RGBA32 0x008B8BFF
#define SG_DARK_GOLDENROD_RGBA32 0xB8860BFF
#define SG_DARK_GRAY_RGBA32 0xA9A9A9FF
#define SG_DARK_GREEN_RGBA32 0x006400FF
#define SG_DARK_KHAKI_RGBA32 0xBDB76BFF
#define SG_DARK_MAGENTA_RGBA32 0x8B008BFF
#define SG_DARK_OLIVE_GREEN_RGBA32 0x556B2FFF
#define SG_DARK_ORANGE_RGBA32 0xFF8C00FF
#define SG_DARK_ORCHID_RGBA32 0x9932CCFF
#define SG_DARK_RED_RGBA32 0x8B0000FF
#define SG_DARK_SALMON_RGBA32 0xE9967AFF
#define SG_DARK_SEA_GREEN_RGBA32 0x8FBC8FFF
#define SG_DARK_SLATE_BLUE_RGBA32 0x483D8BFF
#define SG_DARK_SLATE_GRAY_RGBA32 0x2F4F4FFF
#define SG_DARK_TURQUOISE_RGBA32 0x00CED1FF
#define SG_DARK_VIOLET_RGBA32 0x9400D3FF
#define SG_DEEP_PINK_RGBA32 0xFF1493FF
#define SG_DEEP_SKY_BLUE_RGBA32 0x00BFFFFF
#define SG_DIM_GRAY_RGBA32 0x696969FF
#define SG_DODGER_BLUE_RGBA32 0x1E90FFFF
#define SG_FIREBRICK_RGBA32 0xB22222FF
#define SG_FLORAL_WHITE_RGBA32 0xFFFAF0FF
#define SG_FOREST_GREEN_RGBA32 0x228B22FF
#define SG_FUCHSIA_RGBA32 0xFF00FFFF
#define SG_GAINSBORO_RGBA32 0xDCDCDCFF
#define SG_GHOST_WHITE_RGBA32 0xF8F8FFFF
#define SG_GOLD_RGBA32 0xFFD700FF
#define SG_GOLDENROD_RGBA32 0xDAA520FF
#define SG_GRAY_RGBA32 0xBEBEBEFF
#define SG_WEB_GRAY_RGBA32 0x808080FF
#define SG_GREEN_RGBA32 0x00FF00FF
#define SG_WEB_GREEN_RGBA32 0x008000FF
#define SG_GREEN_YELLOW_RGBA32 0xADFF2FFF
#define SG_HONEYDEW_RGBA32 0xF0FFF0FF
#define SG_HOT_PINK_RGBA32 0xFF69B4FF
#define SG_INDIAN_RED_RGBA32 0xCD5C5CFF
#define SG_INDIGO_RGBA32 0x4B0082FF
#define SG_IVORY_RGBA32 0xFFFFF0FF
#define SG_KHAKI_RGBA32 0xF0E68CFF
#define SG_LAVENDER_RGBA32 0xE6E6FAFF
#define SG_LAVENDER_BLUSH_RGBA32 0xFFF0F5FF
#define SG_LAWN_GREEN_RGBA32 0x7CFC00FF
#define SG_LEMON_CHIFFON_RGBA32 0xFFFACDFF
#define SG_LIGHT_BLUE_RGBA32 0xADD8E6FF
#define SG_LIGHT_CORAL_RGBA32 0xF08080FF
#define SG_LIGHT_CYAN_RGBA32 0xE0FFFFFF
#define SG_LIGHT_GOLDENROD_RGBA32 0xFAFAD2FF
#define SG_LIGHT_GRAY_RGBA32 0xD3D3D3FF
#define SG_LIGHT_GREEN_RGBA32 0x90EE90FF
#define SG_LIGHT_PINK_RGBA32 0xFFB6C1FF
#define SG_LIGHT_SALMON_RGBA32 0xFFA07AFF
#define SG_LIGHT_SEA_GREEN_RGBA32 0x20B2AAFF
#define SG_LIGHT_SKY_BLUE_RGBA32 0x87CEFAFF
#define SG_LIGHT_SLATE_GRAY_RGBA32 0x778899FF
#define SG_LIGHT_STEEL_BLUE_RGBA32 0xB0C4DEFF
#define SG_LIGHT_YELLOW_RGBA32 0xFFFFE0FF
#define SG_LIME_RGBA32 0x00FF00FF
#define SG_LIME_GREEN_RGBA32 0x32CD32FF
#define SG_LINEN_RGBA32 0xFAF0E6FF
#define SG_MAGENTA_RGBA32 0xFF00FFFF
#define SG_MAROON_RGBA32 0xB03060FF
#define SG_WEB_MAROON_RGBA32 0x800000FF
#define SG_MEDIUM_AQUAMARINE_RGBA32 0x66CDAAFF
#define SG_MEDIUM_BLUE_RGBA32 0x0000CDFF
#define SG_MEDIUM_ORCHID_RGBA32 0xBA55D3FF
#define SG_MEDIUM_PURPLE_RGBA32 0x9370DBFF
#define SG_MEDIUM_SEA_GREEN_RGBA32 0x3CB371FF
#define SG_MEDIUM_SLATE_BLUE_RGBA32 0x7B68EEFF
#define SG_MEDIUM_SPRING_GREEN_RGBA32 0x00FA9AFF
#define SG_MEDIUM_TURQUOISE_RGBA32 0x48D1CCFF
#define SG_MEDIUM_VIOLET_RED_RGBA32 0xC71585FF
#define SG_MIDNIGHT_BLUE_RGBA32 0x191970FF
#define SG_MINT_CREAM_RGBA32 0xF5FFFAFF
#define SG_MISTY_ROSE_RGBA32 0xFFE4E1FF
#define SG_MOCCASIN_RGBA32 0xFFE4B5FF
#define SG_NAVAJO_WHITE_RGBA32 0xFFDEADFF
#define SG_NAVY_BLUE_RGBA32 0x000080FF
#define SG_OLD_LACE_RGBA32 0xFDF5E6FF
#define SG_OLIVE_RGBA32 0x808000FF
#define SG_OLIVE_DRAB_RGBA32 0x6B8E23FF
#define SG_ORANGE_RGBA32 0xFFA500FF
#define SG_ORANGE_RED_RGBA32 0xFF4500FF
#define SG_ORCHID_RGBA32 0xDA70D6FF
#define SG_PALE_GOLDENROD_RGBA32 0xEEE8AAFF
#define SG_PALE_GREEN_RGBA32 0x98FB98FF
#define SG_PALE_TURQUOISE_RGBA32 0xAFEEEEFF
#define SG_PALE_VIOLET_RED_RGBA32 0xDB7093FF
#define SG_PAPAYA_WHIP_RGBA32 0xFFEFD5FF
#define SG_PEACH_PUFF_RGBA32 0xFFDAB9FF
#define SG_PERU_RGBA32 0xCD853FFF
#define SG_PINK_RGBA32 0xFFC0CBFF
#define SG_PLUM_RGBA32 0xDDA0DDFF
#define SG_POWDER_BLUE_RGBA32 0xB0E0E6FF
#define SG_PURPLE_RGBA32 0xA020F0FF
#define SG_WEB_PURPLE_RGBA32 0x800080FF
#define SG_REBECCA_PURPLE_RGBA32 0x663399FF
#define SG_RED_RGBA32 0xFF0000FF
#define SG_ROSY_BROWN_RGBA32 0xBC8F8FFF
#define SG_ROYAL_BLUE_RGBA32 0x4169E1FF
#define SG_SADDLE_BROWN_RGBA32 0x8B4513FF
#define SG_SALMON_RGBA32 0xFA8072FF
#define SG_SANDY_BROWN_RGBA32 0xF4A460FF
#define SG_SEA_GREEN_RGBA32 0x2E8B57FF
#define SG_SEASHELL_RGBA32 0xFFF5EEFF
#define SG_SIENNA_RGBA32 0xA0522DFF
#define SG_SILVER_RGBA32 0xC0C0C0FF
#define SG_SKY_BLUE_RGBA32 0x87CEEBFF
#define SG_SLATE_BLUE_RGBA32 0x6A5ACDFF
#define SG_SLATE_GRAY_RGBA32 0x708090FF
#define SG_SNOW_RGBA32 0xFFFAFAFF
#define SG_SPRING_GREEN_RGBA32 0x00FF7FFF
#define SG_STEEL_BLUE_RGBA32 0x4682B4FF
#define SG_TAN_RGBA32 0xD2B48CFF
#define SG_TEAL_RGBA32 0x008080FF
#define SG_THISTLE_RGBA32 0xD8BFD8FF
#define SG_TOMATO_RGBA32 0xFF6347FF
#define SG_TRANSPARENT_RGBA32 0x00000000
#define SG_TURQUOISE_RGBA32 0x40E0D0FF
#define SG_VIOLET_RGBA32 0xEE82EEFF
#define SG_WHEAT_RGBA32 0xF5DEB3FF
#define SG_WHITE_RGBA32 0xFFFFFFFF
#define SG_WHITE_SMOKE_RGBA32 0xF5F5F5FF
#define SG_YELLOW_RGBA32 0xFFFF00FF
#define SG_YELLOW_GREEN_RGBA32 0x9ACD32FF


