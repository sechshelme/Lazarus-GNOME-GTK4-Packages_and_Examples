unit fp_sixel;

interface

const
  {$IFDEF Linux}
  libsixel = 'libsixel';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeInt;

  // ================

const
  LIBSIXEL_VERSION = '1.10.3';
  PACKAGE_VERSION = LIBSIXEL_VERSION;
  LIBSIXEL_ABI_VERSION = '@LS_LT_CURRENT@:@LS_LT_REVISION@:@LS_LT_AGE@';
  LS_LTVERSION = LIBSIXEL_ABI_VERSION;
  PACKAGE_DESCRIPTION = 'A lightweight, fast C implementation of DEC SIXEL graphics codec';

type
  Psixel_index_t = ^Tsixel_index_t;
  Tsixel_index_t = byte;

const
  SIXEL_OUTPUT_PACKET_SIZE = 16384;
  SIXEL_PALETTE_MIN = 2;
  SIXEL_PALETTE_MAX = 256;
  SIXEL_USE_DEPRECATED_SYMBOLS = 1;
  SIXEL_ALLOCATE_BYTES_MAX = (10248 * 1024) * 128;
  SIXEL_WIDTH_LIMIT = 1000000;
  SIXEL_HEIGHT_LIMIT = 1000000;
  SIXEL_DEFALUT_GIF_DELAY = 1;

type
  PSIXELSTATUS = ^TSIXELSTATUS;
  TSIXELSTATUS = longint;

const
  SIXEL_OK = $0000;
  SIXEL_FALSE = $1000;
  SIXEL_RUNTIME_ERROR = SIXEL_FALSE or $0100;
  SIXEL_LOGIC_ERROR = SIXEL_FALSE or $0200;
  SIXEL_FEATURE_ERROR = SIXEL_FALSE or $0300;
  SIXEL_LIBC_ERROR = SIXEL_FALSE or $0400;
  SIXEL_CURL_ERROR = SIXEL_FALSE or $0500;
  SIXEL_JPEG_ERROR = SIXEL_FALSE or $0600;
  SIXEL_PNG_ERROR = SIXEL_FALSE or $0700;
  SIXEL_GDK_ERROR = SIXEL_FALSE or $0800;
  SIXEL_GD_ERROR = SIXEL_FALSE or $0900;
  SIXEL_STBI_ERROR = SIXEL_FALSE or $0a00;
  SIXEL_STBIW_ERROR = SIXEL_FALSE or $0b00;
  SIXEL_INTERRUPTED = SIXEL_OK or $0001;
  SIXEL_BAD_ALLOCATION = SIXEL_RUNTIME_ERROR or $0001;
  SIXEL_BAD_ARGUMENT = SIXEL_RUNTIME_ERROR or $0002;
  SIXEL_BAD_INPUT = SIXEL_RUNTIME_ERROR or $0003;
  SIXEL_BAD_INTEGER_OVERFLOW = SIXEL_RUNTIME_ERROR or $0004;
  SIXEL_NOT_IMPLEMENTED = SIXEL_FEATURE_ERROR or $0001;

const
  SIXEL_LARGE_AUTO = $0;
  SIXEL_LARGE_NORM = $1;
  SIXEL_LARGE_LUM = $2;
  SIXEL_REP_AUTO = $0;
  SIXEL_REP_CENTER_BOX = $1;
  SIXEL_REP_AVERAGE_COLORS = $2;
  SIXEL_REP_AVERAGE_PIXELS = $3;
  SIXEL_DIFFUSE_AUTO = $0;
  SIXEL_DIFFUSE_NONE = $1;
  SIXEL_DIFFUSE_ATKINSON = $2;
  SIXEL_DIFFUSE_FS = $3;
  SIXEL_DIFFUSE_JAJUNI = $4;
  SIXEL_DIFFUSE_STUCKI = $5;
  SIXEL_DIFFUSE_BURKES = $6;
  SIXEL_DIFFUSE_A_DITHER = $7;
  SIXEL_DIFFUSE_X_DITHER = $8;
  SIXEL_QUALITY_AUTO = $0;
  SIXEL_QUALITY_HIGH = $1;
  SIXEL_QUALITY_LOW = $2;
  SIXEL_QUALITY_FULL = $3;
  SIXEL_QUALITY_HIGHCOLOR = $4;
  SIXEL_BUILTIN_MONO_DARK = $0;
  SIXEL_BUILTIN_MONO_LIGHT = $1;
  SIXEL_BUILTIN_XTERM16 = $2;
  SIXEL_BUILTIN_XTERM256 = $3;
  SIXEL_BUILTIN_VT340_MONO = $4;
  SIXEL_BUILTIN_VT340_COLOR = $5;
  SIXEL_BUILTIN_G1 = $6;
  SIXEL_BUILTIN_G2 = $7;
  SIXEL_BUILTIN_G4 = $8;
  SIXEL_BUILTIN_G8 = $9;
  SIXEL_FORMATTYPE_COLOR = 0;
  SIXEL_FORMATTYPE_GRAYSCALE = 1 shl 6;
  SIXEL_FORMATTYPE_PALETTE = 1 shl 7;
  SIXEL_PIXELFORMAT_RGB555 = SIXEL_FORMATTYPE_COLOR or $01;
  SIXEL_PIXELFORMAT_RGB565 = SIXEL_FORMATTYPE_COLOR or $02;
  SIXEL_PIXELFORMAT_RGB888 = SIXEL_FORMATTYPE_COLOR or $03;
  SIXEL_PIXELFORMAT_BGR555 = SIXEL_FORMATTYPE_COLOR or $04;
  SIXEL_PIXELFORMAT_BGR565 = SIXEL_FORMATTYPE_COLOR or $05;
  SIXEL_PIXELFORMAT_BGR888 = SIXEL_FORMATTYPE_COLOR or $06;
  SIXEL_PIXELFORMAT_ARGB8888 = SIXEL_FORMATTYPE_COLOR or $10;
  SIXEL_PIXELFORMAT_RGBA8888 = SIXEL_FORMATTYPE_COLOR or $11;
  SIXEL_PIXELFORMAT_ABGR8888 = SIXEL_FORMATTYPE_COLOR or $12;
  SIXEL_PIXELFORMAT_BGRA8888 = SIXEL_FORMATTYPE_COLOR or $13;
  SIXEL_PIXELFORMAT_G1 = SIXEL_FORMATTYPE_GRAYSCALE or $00;
  SIXEL_PIXELFORMAT_G2 = SIXEL_FORMATTYPE_GRAYSCALE or $01;
  SIXEL_PIXELFORMAT_G4 = SIXEL_FORMATTYPE_GRAYSCALE or $02;
  SIXEL_PIXELFORMAT_G8 = SIXEL_FORMATTYPE_GRAYSCALE or $03;
  SIXEL_PIXELFORMAT_AG88 = SIXEL_FORMATTYPE_GRAYSCALE or $13;
  SIXEL_PIXELFORMAT_GA88 = SIXEL_FORMATTYPE_GRAYSCALE or $23;
  SIXEL_PIXELFORMAT_PAL1 = SIXEL_FORMATTYPE_PALETTE or $00;
  SIXEL_PIXELFORMAT_PAL2 = SIXEL_FORMATTYPE_PALETTE or $01;
  SIXEL_PIXELFORMAT_PAL4 = SIXEL_FORMATTYPE_PALETTE or $02;
  SIXEL_PIXELFORMAT_PAL8 = SIXEL_FORMATTYPE_PALETTE or $03;
  SIXEL_PALETTETYPE_AUTO = 0;
  SIXEL_PALETTETYPE_HLS = 1;
  SIXEL_PALETTETYPE_RGB = 2;
  SIXEL_ENCODEPOLICY_AUTO = 0;
  SIXEL_ENCODEPOLICY_FAST = 1;
  SIXEL_ENCODEPOLICY_SIZE = 2;
  SIXEL_RES_NEAREST = 0;
  SIXEL_RES_GAUSSIAN = 1;
  SIXEL_RES_HANNING = 2;
  SIXEL_RES_HAMMING = 3;
  SIXEL_RES_BILINEAR = 4;
  SIXEL_RES_WELSH = 5;
  SIXEL_RES_BICUBIC = 6;
  SIXEL_RES_LANCZOS2 = 7;
  SIXEL_RES_LANCZOS3 = 8;
  SIXEL_RES_LANCZOS4 = 9;
  SIXEL_FORMAT_GIF = $0;
  SIXEL_FORMAT_PNG = $1;
  SIXEL_FORMAT_BMP = $2;
  SIXEL_FORMAT_JPG = $3;
  SIXEL_FORMAT_TGA = $4;
  SIXEL_FORMAT_WBMP = $5;
  SIXEL_FORMAT_TIFF = $6;
  SIXEL_FORMAT_SIXEL = $7;
  SIXEL_FORMAT_PNM = $8;
  SIXEL_FORMAT_GD2 = $9;
  SIXEL_FORMAT_PSD = $a;
  SIXEL_FORMAT_HDR = $b;
  SIXEL_LOOP_AUTO = 0;
  SIXEL_LOOP_FORCE = 1;
  SIXEL_LOOP_DISABLE = 2;
  SIXEL_OPTFLAG_INPUT = 'i';
  SIXEL_OPTFLAG_OUTPUT = 'o';
  SIXEL_OPTFLAG_OUTFILE = 'o';
  SIXEL_OPTFLAG_7BIT_MODE = '7';
  SIXEL_OPTFLAG_8BIT_MODE = '8';
  SIXEL_OPTFLAG_HAS_GRI_ARG_LIMIT = 'R';
  SIXEL_OPTFLAG_COLORS = 'p';
  SIXEL_OPTFLAG_MAPFILE = 'm';
  SIXEL_OPTFLAG_MONOCHROME = 'e';
  SIXEL_OPTFLAG_INSECURE = 'k';
  SIXEL_OPTFLAG_INVERT = 'i';
  SIXEL_OPTFLAG_HIGH_COLOR = 'I';
  SIXEL_OPTFLAG_USE_MACRO = 'u';
  SIXEL_OPTFLAG_MACRO_NUMBER = 'n';
  SIXEL_OPTFLAG_COMPLEXION_SCORE = 'C';
  SIXEL_OPTFLAG_IGNORE_DELAY = 'g';
  SIXEL_OPTFLAG_STATIC = 'S';
  SIXEL_OPTFLAG_DIFFUSION = 'd';
  SIXEL_OPTFLAG_FIND_LARGEST = 'f';
  SIXEL_OPTFLAG_SELECT_COLOR = 's';
  SIXEL_OPTFLAG_CROP = 'c';
  SIXEL_OPTFLAG_WIDTH = 'w';
  SIXEL_OPTFLAG_HEIGHT = 'h';
  SIXEL_OPTFLAG_RESAMPLING = 'r';
  SIXEL_OPTFLAG_QUALITY = 'q';
  SIXEL_OPTFLAG_LOOPMODE = 'l';
  SIXEL_OPTFLAG_PALETTE_TYPE = 't';
  SIXEL_OPTFLAG_BUILTIN_PALETTE = 'b';
  SIXEL_OPTFLAG_ENCODE_POLICY = 'E';
  SIXEL_OPTFLAG_ORMODE = 'O';
  SIXEL_OPTFLAG_BGCOLOR = 'B';
  SIXEL_OPTFLAG_PENETRATE = 'P';
  SIXEL_OPTFLAG_PIPE_MODE = 'D';
  SIXEL_OPTFLAG_VERBOSE = 'v';
  SIXEL_OPTFLAG_VERSION = 'V';
  SIXEL_OPTFLAG_HELP = 'H';

type
  TcharacterSize = longint;

const
  CSIZE_7BIT = 0;
  CSIZE_8BIT = 1;

type
  TmethodForLargest = longint;

const
  LARGE_AUTO = 0;
  LARGE_NORM = 1;
  LARGE_LUM = 2;

type
  TmethodForRep = longint;

const
  REP_AUTO = 0;
  REP_CENTER_BOX = 1;
  REP_AVERAGE_COLORS = 2;
  REP_AVERAGE_PIXELS = 3;

type
  TmethodForDiffuse = longint;

const
  DIFFUSE_AUTO = 0;
  DIFFUSE_NONE = 1;
  DIFFUSE_ATKINSON = 2;
  DIFFUSE_FS = 3;
  DIFFUSE_JAJUNI = 4;
  DIFFUSE_STUCKI = 5;
  DIFFUSE_BURKES = 6;
  DIFFUSE_A_DITHER = 7;
  DIFFUSE_X_DITHER = 8;

type
  TqualityMode = longint;

const
  QUALITY_AUTO = 0;
  QUALITY_HIGH = 1;
  QUALITY_LOW = 2;
  QUALITY_FULL = 3;
  QUALITY_HIGHCOLOR = 4;

type
  TbuiltinDither = longint;

const
  BUILTIN_MONO_DARK = 0;
  BUILTIN_MONO_LIGHT = 1;
  BUILTIN_XTERM16 = 2;
  BUILTIN_XTERM256 = 3;
  BUILTIN_VT340_MONO = 4;
  BUILTIN_VT340_COLOR = 5;

type
  TformatType = longint;

const
  FORMATTYPE_COLOR = 0;
  FORMATTYPE_GRAYSCALE = 1 shl 6;
  FORMATTYPE_PALETTE = 1 shl 7;

type
  TpixelFormat = longint;

const
  PIXELFORMAT_RGB555 = FORMATTYPE_COLOR or $01;
  PIXELFORMAT_RGB565 = FORMATTYPE_COLOR or $02;
  PIXELFORMAT_RGB888 = FORMATTYPE_COLOR or $03;
  PIXELFORMAT_BGR555 = FORMATTYPE_COLOR or $04;
  PIXELFORMAT_BGR565 = FORMATTYPE_COLOR or $05;
  PIXELFORMAT_BGR888 = FORMATTYPE_COLOR or $06;
  PIXELFORMAT_ARGB8888 = FORMATTYPE_COLOR or $10;
  PIXELFORMAT_RGBA8888 = FORMATTYPE_COLOR or $11;
  PIXELFORMAT_G1 = FORMATTYPE_GRAYSCALE or $00;
  PIXELFORMAT_G2 = FORMATTYPE_GRAYSCALE or $01;
  PIXELFORMAT_G4 = FORMATTYPE_GRAYSCALE or $02;
  PIXELFORMAT_G8 = FORMATTYPE_GRAYSCALE or $03;
  PIXELFORMAT_AG88 = FORMATTYPE_GRAYSCALE or $13;
  PIXELFORMAT_GA88 = FORMATTYPE_GRAYSCALE or $23;
  PIXELFORMAT_PAL1 = FORMATTYPE_PALETTE or $00;
  PIXELFORMAT_PAL2 = FORMATTYPE_PALETTE or $01;
  PIXELFORMAT_PAL4 = FORMATTYPE_PALETTE or $02;
  PIXELFORMAT_PAL8 = FORMATTYPE_PALETTE or $03;

type
  TpaletteType = longint;

const
  PALETTETYPE_AUTO = 0;
  PALETTETYPE_HLS = 1;
  PALETTETYPE_RGB = 2;

type
  TencodePolicy = longint;

const
  ENCODEPOLICY_AUTO = 0;
  ENCODEPOLICY_FAST = 1;
  ENCODEPOLICY_SIZE = 2;

type
  TmethodForResampling = longint;

const
  RES_NEAREST = 0;
  RES_GAUSSIAN = 1;
  RES_HANNING = 2;
  RES_HAMMING = 3;
  RES_BILINEAR = 4;
  RES_WELSH = 5;
  RES_BICUBIC = 6;
  RES_LANCZOS2 = 7;
  RES_LANCZOS3 = 8;
  RES_LANCZOS4 = 9;

type
  Tsixel_malloc_t = function(para1: Tsize_t): pointer; cdecl;
  Tsixel_calloc_t = function(para1: Tsize_t; para2: Tsize_t): pointer; cdecl;
  Tsixel_realloc_t = function(para1: pointer; para2: Tsize_t): pointer; cdecl;
  Tsixel_free_t = procedure(para1: pointer); cdecl;

  Psixel_allocator_t = type Pointer;
  PPsixel_allocator_t = ^Psixel_allocator_t;

function sixel_allocator_new(ppallocator: PPsixel_allocator_t; fn_malloc: Tsixel_malloc_t; fn_calloc: Tsixel_calloc_t; fn_realloc: Tsixel_realloc_t; fn_free: Tsixel_free_t): TSIXELSTATUS; cdecl; external libsixel;
procedure sixel_allocator_ref(allocator: Psixel_allocator_t); cdecl; external libsixel;
procedure sixel_allocator_unref(allocator: Psixel_allocator_t); cdecl; external libsixel;
function sixel_allocator_malloc(allocator: Psixel_allocator_t; n: Tsize_t): pointer; cdecl; external libsixel;
function sixel_allocator_calloc(allocator: Psixel_allocator_t; nelm: Tsize_t; elsize: Tsize_t): pointer; cdecl; external libsixel;
function sixel_allocator_realloc(allocator: Psixel_allocator_t; p: pointer; n: Tsize_t): pointer; cdecl; external libsixel;
procedure sixel_allocator_free(allocator: Psixel_allocator_t; p: pointer); cdecl; external libsixel;

type
  Psixel_output_t = type Pointer;
  PPsixel_output_t = ^Psixel_output_t;

  Tsixel_write_function = function(data: pchar; size: longint; priv: pointer): longint; cdecl;

function sixel_output_new(output: PPsixel_output_t; fn_write: Tsixel_write_function; priv: pointer; allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;
function sixel_output_create(fn_write: Tsixel_write_function; priv: pointer): Psixel_output_t; cdecl; external libsixel; deprecated;
procedure sixel_output_destroy(output: Psixel_output_t); cdecl; external libsixel;
procedure sixel_output_ref(output: Psixel_output_t); cdecl; external libsixel;
procedure sixel_output_unref(output: Psixel_output_t); cdecl; external libsixel;
function sixel_output_get_8bit_availability(output: Psixel_output_t): longint; cdecl; external libsixel;
procedure sixel_output_set_8bit_availability(output: Psixel_output_t; availability: longint); cdecl; external libsixel;
procedure sixel_output_set_gri_arg_limit(output: Psixel_output_t; value: longint); cdecl; external libsixel;
procedure sixel_output_set_penetrate_multiplexer(output: Psixel_output_t; penetrate: longint); cdecl; external libsixel;
procedure sixel_output_set_skip_dcs_envelope(output: Psixel_output_t; skip: longint); cdecl; external libsixel;
procedure sixel_output_set_palette_type(output: Psixel_output_t; palettetype: longint); cdecl; external libsixel;
procedure sixel_output_set_ormode(output: Psixel_output_t; ormode: longint); cdecl; external libsixel;
procedure sixel_output_set_encode_policy(output: Psixel_output_t; encode_policy: longint); cdecl; external libsixel;

type
  Psixel_dither_t = type Pointer;
  PPsixel_dither_t = ^Psixel_dither_t;

function sixel_dither_new(ppdither: PPsixel_dither_t; ncolors: longint; allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;
function sixel_dither_create(ncolors: longint): Psixel_dither_t; cdecl; external libsixel; deprecated;
function sixel_dither_get(builtin_dither: longint): Psixel_dither_t; cdecl; external libsixel;
procedure sixel_dither_destroy(dither: Psixel_dither_t); cdecl; external libsixel;
procedure sixel_dither_ref(dither: Psixel_dither_t); cdecl; external libsixel;
procedure sixel_dither_unref(dither: Psixel_dither_t); cdecl; external libsixel;
function sixel_dither_initialize(dither: Psixel_dither_t; data: pbyte; width: longint; height: longint; pixelformat: longint;
  method_for_largest: longint; method_for_rep: longint; quality_mode: longint): TSIXELSTATUS; cdecl; external libsixel;
procedure sixel_dither_set_diffusion_type(dither: Psixel_dither_t; method_for_diffuse: longint); cdecl; external libsixel;
function sixel_dither_get_num_of_palette_colors(dither: Psixel_dither_t): longint; cdecl; external libsixel;
function sixel_dither_get_num_of_histogram_colors(dither: Psixel_dither_t): longint; cdecl; external libsixel;
function sixel_dither_get_num_of_histgram_colors(dither: Psixel_dither_t): longint; cdecl; external libsixel; deprecated;
function sixel_dither_get_palette(dither: Psixel_dither_t): pbyte; cdecl; external libsixel;
procedure sixel_dither_set_palette(dither: Psixel_dither_t; palette: pbyte); cdecl; external libsixel;
procedure sixel_dither_set_complexion_score(dither: Psixel_dither_t; score: longint); cdecl; external libsixel;
procedure sixel_dither_set_body_only(dither: Psixel_dither_t; bodyonly: longint); cdecl; external libsixel;
procedure sixel_dither_set_optimize_palette(dither: Psixel_dither_t; do_opt: longint); cdecl; external libsixel;
procedure sixel_dither_set_pixelformat(dither: Psixel_dither_t; pixelformat: longint); cdecl; external libsixel;
procedure sixel_dither_set_transparent(dither: Psixel_dither_t; transparent: longint); cdecl; external libsixel;

type
  Tsixel_allocator_function = function(size: Tsize_t): pointer; cdecl;

function sixel_encode(pixels: pbyte; width: longint; height: longint; depth: longint; dither: Psixel_dither_t;
  context: Psixel_output_t): TSIXELSTATUS; cdecl; external libsixel;
function sixel_decode_raw(p: pbyte; len: longint; pixels: PPbyte; pwidth: Plongint; pheight: Plongint;
  palette: PPbyte; ncolors: Plongint; allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;
function sixel_decode(sixels: pbyte; size: longint; pixels: PPbyte; pwidth: Plongint; pheight: Plongint;
  palette: PPbyte; ncolors: Plongint; fn_malloc: Tsixel_allocator_function): TSIXELSTATUS; cdecl; external libsixel;
procedure sixel_helper_set_additional_message(message: pchar); cdecl; external libsixel;
function sixel_helper_get_additional_message: pchar; cdecl; external libsixel;
function sixel_helper_format_error(status: TSIXELSTATUS): pchar; cdecl; external libsixel;
function sixel_helper_compute_depth(pixelformat: longint): longint; cdecl; external libsixel;
function sixel_helper_normalize_pixelformat(dst: pbyte; dst_pixelformat: Plongint; src: pbyte; src_pixelformat: longint; width: longint;
  height: longint): TSIXELSTATUS; cdecl; external libsixel;
function sixel_helper_scale_image(dst: pbyte; src: pbyte; srcw: longint; srch: longint; pixelformat: longint;
  dstw: longint; dsth: longint; method_for_resampling: longint; allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;

type
  TimageFormat = longint;

const
  FORMAT_GIF = 0;
  FORMAT_PNG = 1;
  FORMAT_BMP = 2;
  FORMAT_JPG = 3;
  FORMAT_TGA = 4;
  FORMAT_WBMP = 5;
  FORMAT_TIFF = 6;
  FORMAT_SIXEL = 7;
  FORMAT_PNM = 8;
  FORMAT_GD2 = 9;
  FORMAT_PSD = 10;
  FORMAT_HDR = 11;

type
  TloopControl = longint;

const
  LOOP_AUTO = 0;
  LOOP_FORCE = 1;
  LOOP_DISABLE = 2;

type
  Psixel_frame_t = type Pointer;
  PPsixel_frame_t = ^Psixel_frame_t;

function sixel_frame_new(ppframe: PPsixel_frame_t; allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;
function sixel_frame_create: Psixel_frame_t; cdecl; external libsixel; deprecated;
procedure sixel_frame_ref(frame: Psixel_frame_t); cdecl; external libsixel;
procedure sixel_frame_unref(frame: Psixel_frame_t); cdecl; external libsixel;
function sixel_frame_init(frame: Psixel_frame_t; pixels: pbyte; width: longint; height: longint; pixelformat: longint;
  palette: pbyte; ncolors: longint): TSIXELSTATUS; cdecl; external libsixel;
function sixel_frame_get_pixels(frame: Psixel_frame_t): pbyte; cdecl; external libsixel;
function sixel_frame_get_palette(frame: Psixel_frame_t): pbyte; cdecl; external libsixel;
function sixel_frame_get_width(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_get_height(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_get_ncolors(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_get_pixelformat(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_get_transparent(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_get_multiframe(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_get_delay(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_get_frame_no(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_get_loop_no(frame: Psixel_frame_t): longint; cdecl; external libsixel;
function sixel_frame_strip_alpha(frame: Psixel_frame_t; bgcolor: pbyte): longint; cdecl; external libsixel;
function sixel_frame_resize(frame: Psixel_frame_t; width: longint; height: longint; method_for_resampling: longint): TSIXELSTATUS; cdecl; external libsixel;
function sixel_frame_clip(frame: Psixel_frame_t; x: longint; y: longint; width: longint; height: longint): TSIXELSTATUS; cdecl; external libsixel;

type
  Tsixel_load_image_function = function(frame: Psixel_frame_t; context: pointer): TSIXELSTATUS; cdecl;

function sixel_helper_load_image_file(filename: pchar; fstatic: longint; fuse_palette: longint; reqcolors: longint; bgcolor: pbyte;
  loop_control: longint; fn_load: Tsixel_load_image_function; finsecure: longint; cancel_flag: Plongint; context: pointer;
  allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;
function sixel_helper_write_image_file(data: pbyte; width: longint; height: longint; palette: pbyte; pixelformat: longint;
  filename: pchar; imageformat: longint; allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;

type
  Psixel_encoder_t = type Pointer;
  PPsixel_encoder_t = ^Psixel_encoder_t;

function sixel_encoder_new(ppencoder: PPsixel_encoder_t; allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;
function sixel_encoder_create: Psixel_encoder_t; cdecl; external libsixel; deprecated;
procedure sixel_encoder_ref(encoder: Psixel_encoder_t); cdecl; external libsixel;
procedure sixel_encoder_unref(encoder: Psixel_encoder_t); cdecl; external libsixel;
function sixel_encoder_set_cancel_flag(encoder: Psixel_encoder_t; cancel_flag: Plongint): TSIXELSTATUS; cdecl; external libsixel;
function sixel_encoder_setopt(encoder: Psixel_encoder_t; arg: longint; optarg: pchar): TSIXELSTATUS; cdecl; external libsixel;
function sixel_encoder_encode(encoder: Psixel_encoder_t; filename: pchar): TSIXELSTATUS; cdecl; external libsixel;
function sixel_encoder_encode_bytes(encoder: Psixel_encoder_t; bytes: pbyte; width: longint; height: longint; pixelformat: longint;
  palette: pbyte; ncolors: longint): TSIXELSTATUS; cdecl; external libsixel;

type
  Psixel_decoder_t = type Pointer;
  PPsixel_decoder_t = ^Psixel_decoder_t;

function sixel_decoder_new(ppdecoder: PPsixel_decoder_t; allocator: Psixel_allocator_t): TSIXELSTATUS; cdecl; external libsixel;
function sixel_decoder_create: Psixel_decoder_t; cdecl; external libsixel; deprecated;
procedure sixel_decoder_ref(decoder: Psixel_decoder_t); cdecl; external libsixel;
procedure sixel_decoder_unref(decoder: Psixel_decoder_t); cdecl; external libsixel;
function sixel_decoder_setopt(decoder: Psixel_decoder_t; arg: longint; optarg: pchar): TSIXELSTATUS; cdecl; external libsixel;
function sixel_decoder_decode(decoder: Psixel_decoder_t): TSIXELSTATUS; cdecl; external libsixel;

function SIXEL_SUCCEEDED(status: longint): boolean;
function SIXEL_FAILED(status: longint): boolean;


// === Konventiert am: 4-5-25 17:26:16 ===


implementation


function SIXEL_SUCCEEDED(status: longint): boolean;
begin
  SIXEL_SUCCEEDED := status and $1000 = 0;
end;

function SIXEL_FAILED(status: longint): boolean;
begin
  SIXEL_FAILED := status and $1000 <> 0;
end;


end.
