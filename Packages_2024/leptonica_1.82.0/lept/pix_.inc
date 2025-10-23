{$IFDEF read_interface}


type
  TPixColormap = record
    arr: pointer;
    depth: Tl_int32;
    nalloc: Tl_int32;
    n: Tl_int32;
  end;
  TPIXCMAP = TPixColormap;
  PPIXCMAP = ^TPIXCMAP;
  PPPIXCMAP = ^PPIXCMAP;

  TPix = record
    w: Tl_uint32;
    h: Tl_uint32;
    d: Tl_uint32;
    spp: Tl_uint32;
    wpl: Tl_uint32;
    refcount: Tl_uint32;
    xres: Tl_int32;
    yres: Tl_int32;
    informat: Tl_int32;
    special: Tl_int32;
    text: pchar;
    colormap: ^TPixColormap;
    data: Pl_uint32;
  end;
  PPIX = ^TPix;
  PPPIX = ^PPIX;


  TRGBA_Quad = record
    blue: Tl_uint8;
    green: Tl_uint8;
    red: Tl_uint8;
    alpha: Tl_uint8;
  end;
  PRGBA_QUAD = ^TRGBA_Quad;

const
  COLOR_RED = 0;
  COLOR_GREEN = 1;
  COLOR_BLUE = 2;
  L_ALPHA_CHANNEL = 3;

const
  L_RED_SHIFT = 8 * (sizeof(Tl_uint32) - 1 - COLOR_RED);
  L_GREEN_SHIFT = 8 * (sizeof(Tl_uint32) - 1 - COLOR_GREEN);
  L_BLUE_SHIFT = 8 * (sizeof(Tl_uint32) - 1 - COLOR_BLUE);
  L_ALPHA_SHIFT = 8 * (sizeof(Tl_uint32) - 1 - L_ALPHA_CHANNEL);

const
  L_DRAW_RED = 0;
  L_DRAW_GREEN = 1;
  L_DRAW_BLUE = 2;
  L_DRAW_SPECIFIED = 3;
  L_DRAW_RGB = 4;
  L_DRAW_RANDOM = 5;

const
  L_RED_WEIGHT = 0.3;
  L_GREEN_WEIGHT = 0.5;
  L_BLUE_WEIGHT = 0.2;

const
  REMOVE_CMAP_TO_BINARY = 0;
  REMOVE_CMAP_TO_GRAYSCALE = 1;
  REMOVE_CMAP_TO_FULL_COLOR = 2;
  REMOVE_CMAP_WITH_ALPHA = 3;
  REMOVE_CMAP_BASED_ON_SRC = 4;

function PIX_NOT(op: byte): byte; inline;

const
  PIX_SRC = $c;
  PIX_DST = $a;
  PIX_CLR = $0;
  PIX_SET = $f;
  PIX_PAINT = PIX_SRC or PIX_DST;
  PIX_MASK = PIX_SRC and PIX_DST;
  PIX_SUBTRACT = PIX_DST and (PIX_SRC xor $0F);
  PIX_XOR = PIX_SRC xor PIX_DST;

const
  PIXAA_VERSION_NUMBER = 2;
  PIXA_VERSION_NUMBER = 2;
  BOXA_VERSION_NUMBER = 2;
  BOXAA_VERSION_NUMBER = 3;

type
  TBoxa = record
    n: Tl_int32;
    nalloc: Tl_int32;
    refcount: Tl_uint32;
    box: ^PBox;
  end;
  PBOXA = ^TBoxa;
  PPBOXA = ^PBOXA;

  TPixa = record
    n: Tl_int32;
    nalloc: Tl_int32;
    refcount: Tl_uint32;
    pix: ^PPix;
    boxa: PBoxa;
  end;
  PPIXA = ^TPixa;
  PPPIXA = ^PPIXA;

  TPixaa = record
    n: Tl_int32;
    nalloc: Tl_int32;
    pixa: ^PPixa;
    boxa: PBoxa;
  end;
  PPIXAA = ^TPixaa;
  PPPIXAA = ^PPIXAA;

  TBox = record
    x: Tl_int32;
    y: Tl_int32;
    w: Tl_int32;
    h: Tl_int32;
    refcount: Tl_uint32;
  end;
  PBOX = ^TBox;
  PPBOX = ^PBOX;

  TBoxaa = record
    n: Tl_int32;
    nalloc: Tl_int32;
    boxa: ^PBoxa;
  end;
  PBOXAA = ^TBoxaa;
  PPBOXAA = ^PBOXAA;

const
  PTA_VERSION_NUMBER = 1;

type
  TPta = record
    n: Tl_int32;
    nalloc: Tl_int32;
    refcount: Tl_uint32;
    x: Pl_float32;
    y: Pl_float32;
  end;
  PPTA = ^TPta;
  PPPTA = ^PPTA;

  TPtaa = record
    n: Tl_int32;
    nalloc: Tl_int32;
    pta: ^PPta;
  end;
  PPTAA = ^TPtaa;
  PPPTAA = ^PPTAA;

  TPixacc = record
    w: Tl_int32;
    h: Tl_int32;
    offset: Tl_int32;
    pix: PPix;
  end;
  PPIXACC = ^TPixacc;
  PPPIXACC = ^PPIXACC;

  TPixTiling = record
    pix: PPix;
    nx: Tl_int32;
    ny: Tl_int32;
    w: Tl_int32;
    h: Tl_int32;
    xoverlap: Tl_int32;
    yoverlap: Tl_int32;
    strip: Tl_int32;
  end;
  PPIXTILING = ^TPixTiling;
  PPPIXTILING = ^PPIXTILING;

const
  FPIX_VERSION_NUMBER = 2;

type
  TFPix = record
    w: Tl_int32;
    h: Tl_int32;
    wpl: Tl_int32;
    refcount: Tl_uint32;
    xres: Tl_int32;
    yres: Tl_int32;
    data: Pl_float32;
  end;
  PFPIX = ^TFPix;
  PPFPIX = ^PFPIX;

  TFPixa = record
    n: Tl_int32;
    nalloc: Tl_int32;
    refcount: Tl_uint32;
    fpix: ^PFPix;
  end;
  PFPIXA = ^TFPixa;
  PPFPIXA = ^PFPIXA;

const
  DPIX_VERSION_NUMBER = 2;

type
  TDPix = record
    w: Tl_int32;
    h: Tl_int32;
    wpl: Tl_int32;
    refcount: Tl_uint32;
    xres: Tl_int32;
    yres: Tl_int32;
    data: Pl_float64;
  end;
  PDPIX = ^TDPix;
  PPDPix = ^PDPix;

  TPixComp = record
    w: Tl_int32;
    h: Tl_int32;
    d: Tl_int32;
    xres: Tl_int32;
    yres: Tl_int32;
    comptype: Tl_int32;
    text: pchar;
    cmapflag: Tl_int32;
    data: Pl_uint8;
    size: Tsize_t;
  end;
  PPixComp = ^TPixComp;
  TPIXC = TPixComp;
  PPIXC = ^TPIXC;
  PPPIXC = ^PPIXC;

const
  PIXACOMP_VERSION_NUMBER = 2;

type
  TPixaComp = record
    n: Tl_int32;
    nalloc: Tl_int32;
    offset: Tl_int32;
    pixc: ^PPixComp;
    boxa: PBoxa;
  end;
  PPixaComp = ^TPixaComp;
  TPIXAC = TPixaComp;
  PPIXAC = ^TPIXAC;
  PPPIXAC = ^PPIXAC;

const
  L_NOCOPY = 0;
  L_INSERT = L_NOCOPY;
  L_COPY = 1;
  L_CLONE = 2;
  L_COPY_CLONE = 3;

const
  L_SHELL_SORT = 1;
  L_BIN_SORT = 2;

const
  L_SORT_INCREASING = 1;
  L_SORT_DECREASING = 2;

const
  L_SORT_BY_X = 1;
  L_SORT_BY_Y = 2;
  L_SORT_BY_RIGHT = 3;
  L_SORT_BY_BOT = 4;
  L_SORT_BY_WIDTH = 5;
  L_SORT_BY_HEIGHT = 6;
  L_SORT_BY_MIN_DIMENSION = 7;
  L_SORT_BY_MAX_DIMENSION = 8;
  L_SORT_BY_PERIMETER = 9;
  L_SORT_BY_AREA = 10;
  L_SORT_BY_ASPECT_RATIO = 11;

const
  L_BLEND_WITH_INVERSE = 1;
  L_BLEND_TO_WHITE = 2;
  L_BLEND_TO_BLACK = 3;
  L_BLEND_GRAY = 4;
  L_BLEND_GRAY_WITH_INVERSE = 5;

const
  L_PAINT_LIGHT = 1;
  L_PAINT_DARK = 2;

const
  L_SET_PIXELS = 1;
  L_CLEAR_PIXELS = 2;
  L_FLIP_PIXELS = 3;

const
  L_SELECT_IF_LT = 1;
  L_SELECT_IF_GT = 2;
  L_SELECT_IF_LTE = 3;
  L_SELECT_IF_GTE = 4;

const
  L_SELECT_BY_WIDTH = 1;
  L_SELECT_BY_HEIGHT = 2;
  L_SELECT_BY_MAX_DIMENSION = 3;
  L_SELECT_BY_AREA = 4;
  L_SELECT_BY_PERIMETER = 5;

const
  L_SELECT_WIDTH = 1;
  L_SELECT_HEIGHT = 2;
  L_SELECT_XVAL = 3;
  L_SELECT_YVAL = 4;
  L_SELECT_IF_EITHER = 5;
  L_SELECT_IF_BOTH = 6;

const
  L_CHECK_WIDTH = 1;
  L_CHECK_HEIGHT = 2;
  L_CHECK_BOTH = 3;

const
  L_SELECT_RED = 1;
  L_SELECT_GREEN = 2;
  L_SELECT_BLUE = 3;
  L_SELECT_MIN = 4;
  L_SELECT_MAX = 5;
  L_SELECT_AVERAGE = 6;
  L_SELECT_HUE = 7;
  L_SELECT_SATURATION = 8;
  L_SELECT_WEIGHTED = 9;

const
  L_INTERMED_DIFF = 1;
  L_AVE_MAX_DIFF_2 = 2;
  L_MAX_DIFF = 3;

const
  L_LS_BYTE = 1;
  L_MS_BYTE = 2;
  L_AUTO_BYTE = 3;
  L_CLIP_TO_FF = 4;
  L_LS_TWO_BYTES = 5;
  L_MS_TWO_BYTES = 6;
  L_CLIP_TO_FFFF = 7;

const
  L_ROTATE_AREA_MAP = 1;
  L_ROTATE_SHEAR = 2;
  L_ROTATE_SAMPLING = 3;

const
  L_BRING_IN_WHITE = 1;
  L_BRING_IN_BLACK = 2;

const
  L_SHEAR_ABOUT_CORNER = 1;
  L_SHEAR_ABOUT_CENTER = 2;

const
  L_TR_SC_RO = 1;
  L_SC_RO_TR = 2;
  L_RO_TR_SC = 3;
  L_TR_RO_SC = 4;
  L_RO_SC_TR = 5;
  L_SC_TR_RO = 6;

const
  L_FILL_WHITE = 1;
  L_FILL_BLACK = 2;

const
  L_SET_WHITE = 1;
  L_SET_BLACK = 2;

const
  L_GET_WHITE_VAL = 1;
  L_GET_BLACK_VAL = 2;

const
  L_WHITE_IS_MAX = 1;
  L_BLACK_IS_MAX = 2;

const
  DEFAULT_CLIP_LOWER_1 = 10;
  DEFAULT_CLIP_UPPER_1 = 10;
  DEFAULT_CLIP_LOWER_2 = 5;
  DEFAULT_CLIP_UPPER_2 = 5;

const
  L_MANHATTAN_DISTANCE = 1;
  L_EUCLIDEAN_DISTANCE = 2;

const
  L_NEGATIVE = 1;
  L_NON_NEGATIVE = 2;
  L_POSITIVE = 3;
  L_NON_POSITIVE = 4;
  L_ZERO = 5;
  L_ALL = 6;

const
  L_MEAN_ABSVAL = 1;
  L_MEDIAN_VAL = 2;
  L_MODE_VAL = 3;
  L_MODE_COUNT = 4;
  L_ROOT_MEAN_SQUARE = 5;
  L_STANDARD_DEVIATION = 6;
  L_VARIANCE = 7;

const
  L_CHOOSE_CONSECUTIVE = 1;
  L_CHOOSE_SKIP_BY = 2;

const
  L_TEXT_ORIENT_UNKNOWN = 0;
  L_TEXT_ORIENT_UP = 1;
  L_TEXT_ORIENT_LEFT = 2;
  L_TEXT_ORIENT_DOWN = 3;
  L_TEXT_ORIENT_RIGHT = 4;

const
  L_HORIZONTAL_EDGES = 0;
  L_VERTICAL_EDGES = 1;
  L_ALL_EDGES = 2;

const
  L_HORIZONTAL_LINE = 0;
  L_POS_SLOPE_LINE = 1;
  L_VERTICAL_LINE = 2;
  L_NEG_SLOPE_LINE = 3;
  L_OBLIQUE_LINE = 4;

const
  L_PORTRAIT_MODE = 0;
  L_LANDSCAPE_MODE = 1;

const
  L_FROM_LEFT = 0;
  L_FROM_RIGHT = 1;
  L_FROM_TOP = 2;
  L_FROM_BOT = 3;
  L_SCAN_NEGATIVE = 4;
  L_SCAN_POSITIVE = 5;
  L_SCAN_BOTH = 6;
  L_SCAN_HORIZONTAL = 7;
  L_SCAN_VERTICAL = 8;

const
  L_ADJUST_SKIP = 0;
  L_ADJUST_LEFT = 1;
  L_ADJUST_RIGHT = 2;
  L_ADJUST_LEFT_AND_RIGHT = 3;
  L_ADJUST_TOP = 4;
  L_ADJUST_BOT = 5;
  L_ADJUST_TOP_AND_BOT = 6;
  L_ADJUST_CHOOSE_MIN = 7;
  L_ADJUST_CHOOSE_MAX = 8;
  L_SET_LEFT = 9;
  L_SET_RIGHT = 10;
  L_SET_TOP = 11;
  L_SET_BOT = 12;
  L_GET_LEFT = 13;
  L_GET_RIGHT = 14;
  L_GET_TOP = 15;
  L_GET_BOT = 16;

const
  L_USE_MINSIZE = 1;
  L_USE_MAXSIZE = 2;
  L_SUB_ON_LOC_DIFF = 3;
  L_SUB_ON_SIZE_DIFF = 4;
  L_USE_CAPPED_MIN = 5;
  L_USE_CAPPED_MAX = 6;

const
  L_COMBINE = 1;
  L_REMOVE_SMALL = 2;

const
  L_GEOMETRIC_UNION = 1;
  L_GEOMETRIC_INTERSECTION = 2;
  L_LARGEST_AREA = 3;
  L_SMALLEST_AREA = 4;

const
  L_USE_ALL_BOXES = 1;
  L_USE_SAME_PARITY_BOXES = 2;

const
  L_UPPER_LEFT = 1;
  L_UPPER_RIGHT = 2;
  L_LOWER_LEFT = 3;
  L_LOWER_RIGHT = 4;
  L_BOX_CENTER = 5;

const
  L_WARP_TO_LEFT = 1;
  L_WARP_TO_RIGHT = 2;

const
  L_LINEAR_WARP = 1;
  L_QUADRATIC_WARP = 2;

const
  L_INTERPOLATED = 1;
  L_SAMPLED = 2;

const
  L_THIN_FG = 1;
  L_THIN_BG = 2;

const
  L_HORIZONTAL_RUNS = 0;
  L_VERTICAL_RUNS = 1;

const
  L_SOBEL_EDGE = 1;
  L_TWO_SIDED_EDGE = 2;

const
  L_SUBPIXEL_ORDER_RGB = 1;
  L_SUBPIXEL_ORDER_BGR = 2;
  L_SUBPIXEL_ORDER_VRGB = 3;
  L_SUBPIXEL_ORDER_VBGR = 4;

const
  L_HS_HISTO = 1;
  L_HV_HISTO = 2;
  L_SV_HISTO = 3;

const
  L_INCLUDE_REGION = 1;
  L_EXCLUDE_REGION = 2;

const
  L_ADD_ABOVE = 1;
  L_ADD_BELOW = 2;
  L_ADD_LEFT = 3;
  L_ADD_RIGHT = 4;
  L_ADD_AT_TOP = 5;
  L_ADD_AT_BOT = 6;
  L_ADD_AT_LEFT = 7;
  L_ADD_AT_RIGHT = 8;

const
  L_PLOT_AT_TOP = 1;
  L_PLOT_AT_MID_HORIZ = 2;
  L_PLOT_AT_BOT = 3;
  L_PLOT_AT_LEFT = 4;
  L_PLOT_AT_MID_VERT = 5;
  L_PLOT_AT_RIGHT = 6;

const
  L_USE_INNER = 1;
  L_USE_OUTER = 2;

const
  L_DISPLAY_WITH_XZGV = 1;
  L_DISPLAY_WITH_XLI = 2;
  L_DISPLAY_WITH_XV = 3;
  L_DISPLAY_WITH_IV = 4;
  L_DISPLAY_WITH_OPEN = 5;

const
  L_NO_CHROMA_SAMPLING_JPEG = 1;

const
  L_CLIP_TO_ZERO = 1;
  L_TAKE_ABSVAL = 2;

const
  L_LESS_THAN_ZERO = 1;
  L_EQUAL_TO_ZERO = 2;
  L_GREATER_THAN_ZERO = 3;

const
  L_ADD_TRAIL_SLASH = 1;
  L_REMOVE_TRAIL_SLASH = 2;

type
  Talloc_fn = function(para1: Tsize_t): pointer; cdecl;
  Tdealloc_fn = procedure(para1: pointer); cdecl;

  // === Konventiert am: 16-8-25 19:11:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function PIX_NOT(op: byte): byte; inline;
begin
  Result := op xor $0F;
end;


{$ENDIF read_implementation}
