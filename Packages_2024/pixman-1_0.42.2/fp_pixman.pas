unit fp_pixman;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  libpixman = 'libpixman-1';
  {$ENDIF}

  {$IFDEF mswindows}
  libpixman = 'libpixman-1-0.dll';
  {$ENDIF}

type
  {$IFDEF Linux}
  Tclong = int64;
  {$ENDIF}

  {$IFDEF mswindows}
  Tclong = int32;
  {$ENDIF}

  // ==== pixman_version.h

const
  PIXMAN_VERSION_MAJOR = 0;
  PIXMAN_VERSION_MINOR = 42;
  PIXMAN_VERSION_MICRO = 2;

  PIXMAN_VERSION_STRING_ = '0.42.2';

  PIXMAN_VERSION_ = (PIXMAN_VERSION_MAJOR * 10000) + (PIXMAN_VERSION_MINOR * 100) + (PIXMAN_VERSION_MICRO * 1);

  // ==== pixman.h

type
  Ppixman_bool = ^Tpixman_bool;
  Tpixman_bool = Boolean32;

  Ppixman_fixed_32_32 = ^Tpixman_fixed_32_32;
  Tpixman_fixed_32_32 = int64;

  Ppixman_fixed_48_16 = ^Tpixman_fixed_48_16;
  Tpixman_fixed_48_16 = Tpixman_fixed_32_32;

  Ppixman_fixed_1_31 = ^Tpixman_fixed_1_31;
  Tpixman_fixed_1_31 = uint32;

  Ppixman_fixed_1_16 = ^Tpixman_fixed_1_16;
  Tpixman_fixed_1_16 = uint32;

  Ppixman_fixed_16_16 = ^Tpixman_fixed_16_16;
  Tpixman_fixed_16_16 = int32;

  Ppixman_fixed = ^Tpixman_fixed;
  Tpixman_fixed = Tpixman_fixed_16_16;

const
  pixman_fixed_e = Tpixman_fixed(1);
  pixman_fixed_1 = Tpixman_fixed(1 shl 16); // 65536
  pixman_fixed_1_minus_e = Tpixman_fixed((1 shl 16) - 1); // 65535
  pixman_fixed_minus_1 = Tpixman_fixed(-1 shl 16); // -65536

  pixman_max_fixed_48_16 = Tpixman_fixed_48_16($7fffffff);
  pixman_min_fixed_48_16 = Tpixman_fixed_48_16(-2147483648); // oder (-1 shl 31)

function Tpixman_fixedo_int(f: Tpixman_fixed): integer;
function pixman_int_to_fixed(i: integer): Tpixman_fixed;
function Tpixman_fixedo_double(f: Tpixman_fixed): double;
function pixman_double_to_fixed(d: double): Tpixman_fixed;
function pixman_fixed_frac(f: Tpixman_fixed): Tpixman_fixed;
function pixman_fixed_floor(f: Tpixman_fixed): Tpixman_fixed;
function pixman_fixed_ceil(f: Tpixman_fixed): Tpixman_fixed;
function pixman_fixed_fraction(f: Tpixman_fixed): Tpixman_fixed;
function pixman_fixed_mod_2(f: Tpixman_fixed): Tpixman_fixed;

type
  Tpixman_color = record
    red: uint16;
    green: uint16;
    blue: uint16;
    alpha: uint16;
  end;
  Ppixman_color = ^Tpixman_color;

  Tpixman_point_fixed = record
    x: Tpixman_fixed;
    y: Tpixman_fixed;
  end;
  Ppixman_point_fixed = ^Tpixman_point_fixed;

  Tpixman_line_fixed = record
    p1: Tpixman_point_fixed;
    p2: Tpixman_point_fixed;
  end;
  Ppixman_line_fixed = ^Tpixman_line_fixed;

  Tpixman_vector = record
    vector: array[0..2] of Tpixman_fixed;
  end;
  Ppixman_vector = ^Tpixman_vector;

  Tpixman_transform = record
    matrix: array[0..2] of array[0..2] of Tpixman_fixed;
  end;
  Ppixman_transform = ^Tpixman_transform;

  Tpixman_image = record
  end;
  Ppixman_image = ^Tpixman_image;

type
  Tpixman_region16_data = record
    size: Tclong;
    numRects: Tclong;
  end;
  Ppixman_region16_data = ^Tpixman_region16_data;

  Tpixman_rectangle16 = record
    x: int16;
    y: int16;
    width: uint16;
    height: uint16;
  end;
  Ppixman_rectangle16 = ^Tpixman_rectangle16;

  Tpixman_box16 = record
    x1: int16;
    y1: int16;
    x2: int16;
    y2: int16;
  end;
  Ppixman_box16 = ^Tpixman_box16;

  Tpixman_region16 = record
    extents: Tpixman_box16;
    data: Ppixman_region16_data;
  end;
  Ppixman_region16 = ^Tpixman_region16;

procedure pixman_transform_init_identity(matrix: Ppixman_transform); cdecl; external libpixman;
function pixman_transform_point_3d(transform: Ppixman_transform; vector: Ppixman_vector): Tpixman_bool; cdecl; external libpixman;
function pixman_transform_point(transform: Ppixman_transform; vector: Ppixman_vector): Tpixman_bool; cdecl; external libpixman;
function pixman_transform_multiply(dst: Ppixman_transform; l: Ppixman_transform; r: Ppixman_transform): Tpixman_bool; cdecl; external libpixman;
procedure pixman_transform_init_scale(t: Ppixman_transform; sx: Tpixman_fixed; sy: Tpixman_fixed); cdecl; external libpixman;
function pixman_transform_scale(forward: Ppixman_transform; reverse: Ppixman_transform; sx: Tpixman_fixed; sy: Tpixman_fixed): Tpixman_bool; cdecl; external libpixman;
procedure pixman_transform_init_rotate(t: Ppixman_transform; cos: Tpixman_fixed; sin: Tpixman_fixed); cdecl; external libpixman;
function pixman_transform_rotate(forward: Ppixman_transform; reverse: Ppixman_transform; c: Tpixman_fixed; s: Tpixman_fixed): Tpixman_bool; cdecl; external libpixman;
procedure pixman_transform_init_translate(t: Ppixman_transform; tx: Tpixman_fixed; ty: Tpixman_fixed); cdecl; external libpixman;
function pixman_transform_translate(forward: Ppixman_transform; reverse: Ppixman_transform; tx: Tpixman_fixed; ty: Tpixman_fixed): Tpixman_bool; cdecl; external libpixman;
function pixman_transform_bounds(matrix: Ppixman_transform; b: Ppixman_box16): Tpixman_bool; cdecl; external libpixman;
function pixman_transform_invert(dst: Ppixman_transform; src: Ppixman_transform): Tpixman_bool; cdecl; external libpixman;
function pixman_transform_is_identity(t: Ppixman_transform): Tpixman_bool; cdecl; external libpixman;
function pixman_transform_is_scale(t: Ppixman_transform): Tpixman_bool; cdecl; external libpixman;
function pixman_transform_is_int_translate(t: Ppixman_transform): Tpixman_bool; cdecl; external libpixman;
function pixman_transform_is_inverse(a: Ppixman_transform; b: Ppixman_transform): Tpixman_bool; cdecl; external libpixman;

type
  Tpixman_f_vector = record
    v: array[0..2] of double;
  end;
  Ppixman_f_vector = ^Tpixman_f_vector;

  Tpixman_f_transform = record
    m: array[0..2] of array[0..2] of double;
  end;
  Ppixman_f_transform = ^Tpixman_f_transform;

function pixman_transform_from_pixman_f_transform(t: Ppixman_transform; ft: Ppixman_f_transform): Tpixman_bool; cdecl; external libpixman;
procedure pixman_f_transform_from_pixman_transform(ft: Ppixman_f_transform; t: Ppixman_transform); cdecl; external libpixman;
function pixman_f_transform_invert(dst: Ppixman_f_transform; src: Ppixman_f_transform): Tpixman_bool; cdecl; external libpixman;
function pixman_f_transform_point(t: Ppixman_f_transform; v: Ppixman_f_vector): Tpixman_bool; cdecl; external libpixman;
procedure pixman_f_transform_point_3d(t: Ppixman_f_transform; v: Ppixman_f_vector); cdecl; external libpixman;
procedure pixman_f_transform_multiply(dst: Ppixman_f_transform; l: Ppixman_f_transform; r: Ppixman_f_transform); cdecl; external libpixman;
procedure pixman_f_transform_init_scale(t: Ppixman_f_transform; sx: double; sy: double); cdecl; external libpixman;
function pixman_f_transform_scale(forward: Ppixman_f_transform; reverse: Ppixman_f_transform; sx: double; sy: double): Tpixman_bool; cdecl; external libpixman;
procedure pixman_f_transform_init_rotate(t: Ppixman_f_transform; cos: double; sin: double); cdecl; external libpixman;
function pixman_f_transform_rotate(forward: Ppixman_f_transform; reverse: Ppixman_f_transform; c: double; s: double): Tpixman_bool; cdecl; external libpixman;
procedure pixman_f_transform_init_translate(t: Ppixman_f_transform; tx: double; ty: double); cdecl; external libpixman;
function pixman_f_transform_translate(forward: Ppixman_f_transform; reverse: Ppixman_f_transform; tx: double; ty: double): Tpixman_bool; cdecl; external libpixman;
function pixman_f_transform_bounds(t: Ppixman_f_transform; b: Ppixman_box16): Tpixman_bool; cdecl; external libpixman;
procedure pixman_f_transform_init_identity(t: Ppixman_f_transform); cdecl; external libpixman;

type
  Ppixman_repeat = ^Tpixman_repeat;
  Tpixman_repeat = longint;

const
  PIXMAN_REPEAT_NONE = 0;
  PIXMAN_REPEAT_NORMAL = 1;
  PIXMAN_REPEAT_PAD = 2;
  PIXMAN_REPEAT_REFLECT = 3;

type
  Ppixman_dither = ^Tpixman_dither;
  Tpixman_dither = longint;

const
  PIXMAN_DITHER_NONE = 0;
  PIXMAN_DITHER_FAST = 1;
  PIXMAN_DITHER_GOOD = 2;
  PIXMAN_DITHER_BEST = 3;
  PIXMAN_DITHER_ORDERED_BAYER_8 = 4;
  PIXMAN_DITHER_ORDERED_BLUE_NOISE_64 = 5;

type
  Ppixman_filter = ^Tpixman_filter;
  Tpixman_filter = longint;

const
  PIXMAN_FILTER_FAST = 0;
  PIXMAN_FILTER_GOOD = 1;
  PIXMAN_FILTER_BEST = 2;
  PIXMAN_FILTER_NEAREST = 3;
  PIXMAN_FILTER_BILINEAR = 4;
  PIXMAN_FILTER_CONVOLUTION = 5;
  PIXMAN_FILTER_SEPARABLE_CONVOLUTION = 6;

type
  Ppixman_op = ^Tpixman_op;
  Tpixman_op = longint;

const
  PIXMAN_OP_CLEAR = $00;
  PIXMAN_OP_SRC = $01;
  PIXMAN_OP_DST = $02;
  PIXMAN_OP_OVER = $03;
  PIXMAN_OP_OVER_REVERSE = $04;
  PIXMAN_OP_IN = $05;
  PIXMAN_OP_IN_REVERSE = $06;
  PIXMAN_OP_OUT = $07;
  PIXMAN_OP_OUT_REVERSE = $08;
  PIXMAN_OP_ATOP = $09;
  PIXMAN_OP_ATOP_REVERSE = $0a;
  PIXMAN_OP_XOR = $0b;
  PIXMAN_OP_ADD = $0c;
  PIXMAN_OP_SATURATE = $0d;
  PIXMAN_OP_DISJOINT_CLEAR = $10;
  PIXMAN_OP_DISJOINT_SRC = $11;
  PIXMAN_OP_DISJOINT_DST = $12;
  PIXMAN_OP_DISJOINT_OVER = $13;
  PIXMAN_OP_DISJOINT_OVER_REVERSE = $14;
  PIXMAN_OP_DISJOINT_IN = $15;
  PIXMAN_OP_DISJOINT_IN_REVERSE = $16;
  PIXMAN_OP_DISJOINT_OUT = $17;
  PIXMAN_OP_DISJOINT_OUT_REVERSE = $18;
  PIXMAN_OP_DISJOINT_ATOP = $19;
  PIXMAN_OP_DISJOINT_ATOP_REVERSE = $1a;
  PIXMAN_OP_DISJOINT_XOR = $1b;
  PIXMAN_OP_CONJOINT_CLEAR = $20;
  PIXMAN_OP_CONJOINT_SRC = $21;
  PIXMAN_OP_CONJOINT_DST = $22;
  PIXMAN_OP_CONJOINT_OVER = $23;
  PIXMAN_OP_CONJOINT_OVER_REVERSE = $24;
  PIXMAN_OP_CONJOINT_IN = $25;
  PIXMAN_OP_CONJOINT_IN_REVERSE = $26;
  PIXMAN_OP_CONJOINT_OUT = $27;
  PIXMAN_OP_CONJOINT_OUT_REVERSE = $28;
  PIXMAN_OP_CONJOINT_ATOP = $29;
  PIXMAN_OP_CONJOINT_ATOP_REVERSE = $2a;
  PIXMAN_OP_CONJOINT_XOR = $2b;
  PIXMAN_OP_MULTIPLY = $30;
  PIXMAN_OP_SCREEN = $31;
  PIXMAN_OP_OVERLAY = $32;
  PIXMAN_OP_DARKEN = $33;
  PIXMAN_OP_LIGHTEN = $34;
  PIXMAN_OP_COLOR_DODGE = $35;
  PIXMAN_OP_COLOR_BURN = $36;
  PIXMAN_OP_HARD_LIGHT = $37;
  PIXMAN_OP_SOFT_LIGHT = $38;
  PIXMAN_OP_DIFFERENCE = $39;
  PIXMAN_OP_EXCLUSION = $3a;
  PIXMAN_OP_HSL_HUE = $3b;
  PIXMAN_OP_HSL_SATURATION = $3c;
  PIXMAN_OP_HSL_COLOR = $3d;
  PIXMAN_OP_HSL_LUMINOSITY = $3e;
  PIXMAN_N_OPERATORS = 63;
  PIXMAN_OP_NONE = PIXMAN_N_OPERATORS;

type
  Ppixman_region_overlap = ^Tpixman_region_overlap;
  Tpixman_region_overlap = longint;

const
  PIXMAN_REGION_OUT = 0;
  PIXMAN_REGION_IN = 1;
  PIXMAN_REGION_PART = 2;

procedure pixman_region_set_static_pointers(empty_box: Ppixman_box16; empty_data: Ppixman_region16_data; broken_data: Ppixman_region16_data); cdecl; external libpixman;
procedure pixman_region_init(region: Ppixman_region16); cdecl; external libpixman;
procedure pixman_region_init_rect(region: Ppixman_region16; x: longint; y: longint; width: dword; height: dword); cdecl; external libpixman;
function pixman_region_init_rects(region: Ppixman_region16; boxes: Ppixman_box16; count: longint): Tpixman_bool; cdecl; external libpixman;
procedure pixman_region_init_with_extents(region: Ppixman_region16; extents: Ppixman_box16); cdecl; external libpixman;
procedure pixman_region_init_from_image(region: Ppixman_region16; image: Ppixman_image); cdecl; external libpixman;
procedure pixman_region_fini(region: Ppixman_region16); cdecl; external libpixman;
procedure pixman_region_translate(region: Ppixman_region16; x: longint; y: longint); cdecl; external libpixman;
function pixman_region_copy(dest: Ppixman_region16; source: Ppixman_region16): Tpixman_bool; cdecl; external libpixman;
function pixman_region_intersect(new_reg: Ppixman_region16; reg1: Ppixman_region16; reg2: Ppixman_region16): Tpixman_bool; cdecl; external libpixman;
function pixman_region_union(new_reg: Ppixman_region16; reg1: Ppixman_region16; reg2: Ppixman_region16): Tpixman_bool; cdecl; external libpixman;
function pixman_region_union_rect(dest: Ppixman_region16; source: Ppixman_region16; x: longint; y: longint; width: dword;
  height: dword): Tpixman_bool; cdecl; external libpixman;
function pixman_region_intersect_rect(dest: Ppixman_region16; source: Ppixman_region16; x: longint; y: longint; width: dword;
  height: dword): Tpixman_bool; cdecl; external libpixman;
function pixman_region_subtract(reg_d: Ppixman_region16; reg_m: Ppixman_region16; reg_s: Ppixman_region16): Tpixman_bool; cdecl; external libpixman;
function pixman_region_inverse(new_reg: Ppixman_region16; reg1: Ppixman_region16; inv_rect: Ppixman_box16): Tpixman_bool; cdecl; external libpixman;
function pixman_region_contains_point(region: Ppixman_region16; x: longint; y: longint; box: Ppixman_box16): Tpixman_bool; cdecl; external libpixman;
function pixman_region_contains_rectangle(region: Ppixman_region16; prect: Ppixman_box16): Tpixman_region_overlap; cdecl; external libpixman;
function pixman_region_not_empty(region: Ppixman_region16): Tpixman_bool; cdecl; external libpixman;
function pixman_region_extents(region: Ppixman_region16): Ppixman_box16; cdecl; external libpixman;
function pixman_region_n_rects(region: Ppixman_region16): longint; cdecl; external libpixman;
function pixman_region_rectangles(region: Ppixman_region16; n_rects: Plongint): Ppixman_box16; cdecl; external libpixman;
function pixman_region_equal(region1: Ppixman_region16; region2: Ppixman_region16): Tpixman_bool; cdecl; external libpixman;
function pixman_region_selfcheck(region: Ppixman_region16): Tpixman_bool; cdecl; external libpixman;
procedure pixman_region_reset(region: Ppixman_region16; box: Ppixman_box16); cdecl; external libpixman;
procedure pixman_region_clear(region: Ppixman_region16); cdecl; external libpixman;

type
  Tpixman_region32_data = record
    size: Tclong;
    numRects: Tclong;
  end;
  Ppixman_region32_data = ^Tpixman_region32_data;

  Tpixman_rectangle32 = record
    x: int32;
    y: int32;
    width: uint32;
    height: uint32;
  end;
  Ppixman_rectangle32 = ^Tpixman_rectangle32;

  Tpixman_box32 = record
    x1: int32;
    y1: int32;
    x2: int32;
    y2: int32;
  end;
  Ppixman_box32 = ^Tpixman_box32;

  Tpixman_region32 = record
    extents: Tpixman_box32;
    data: Ppixman_region32_data;
  end;
  Ppixman_region32 = ^Tpixman_region32;

procedure pixman_region32_init(region: Ppixman_region32); cdecl; external libpixman;
procedure pixman_region32_init_rect(region: Ppixman_region32; x: longint; y: longint; width: dword; height: dword); cdecl; external libpixman;
function pixman_region32_init_rects(region: Ppixman_region32; boxes: Ppixman_box32; count: longint): Tpixman_bool; cdecl; external libpixman;
procedure pixman_region32_init_with_extents(region: Ppixman_region32; extents: Ppixman_box32); cdecl; external libpixman;
procedure pixman_region32_init_from_image(region: Ppixman_region32; image: Ppixman_image); cdecl; external libpixman;
procedure pixman_region32_fini(region: Ppixman_region32); cdecl; external libpixman;
procedure pixman_region32_translate(region: Ppixman_region32; x: longint; y: longint); cdecl; external libpixman;
function pixman_region32_copy(dest: Ppixman_region32; source: Ppixman_region32): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_intersect(new_reg: Ppixman_region32; reg1: Ppixman_region32; reg2: Ppixman_region32): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_union(new_reg: Ppixman_region32; reg1: Ppixman_region32; reg2: Ppixman_region32): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_intersect_rect(dest: Ppixman_region32; source: Ppixman_region32; x: longint; y: longint; width: dword;
  height: dword): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_union_rect(dest: Ppixman_region32; source: Ppixman_region32; x: longint; y: longint; width: dword;
  height: dword): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_subtract(reg_d: Ppixman_region32; reg_m: Ppixman_region32; reg_s: Ppixman_region32): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_inverse(new_reg: Ppixman_region32; reg1: Ppixman_region32; inv_rect: Ppixman_box32): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_contains_point(region: Ppixman_region32; x: longint; y: longint; box: Ppixman_box32): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_contains_rectangle(region: Ppixman_region32; prect: Ppixman_box32): Tpixman_region_overlap; cdecl; external libpixman;
function pixman_region32_not_empty(region: Ppixman_region32): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_extents(region: Ppixman_region32): Ppixman_box32; cdecl; external libpixman;
function pixman_region32_n_rects(region: Ppixman_region32): longint; cdecl; external libpixman;
function pixman_region32_rectangles(region: Ppixman_region32; n_rects: Plongint): Ppixman_box32; cdecl; external libpixman;
function pixman_region32_equal(region1: Ppixman_region32; region2: Ppixman_region32): Tpixman_bool; cdecl; external libpixman;
function pixman_region32_selfcheck(region: Ppixman_region32): Tpixman_bool; cdecl; external libpixman;
procedure pixman_region32_reset(region: Ppixman_region32; box: Ppixman_box32); cdecl; external libpixman;
procedure pixman_region32_clear(region: Ppixman_region32); cdecl; external libpixman;
function pixman_blt(src_bits: Puint32; dst_bits: Puint32; src_stride: longint; dst_stride: longint; src_bpp: longint;
  dst_bpp: longint; src_x: longint; src_y: longint; dest_x: longint; dest_y: longint;
  width: longint; height: longint): Tpixman_bool; cdecl; external libpixman;
function pixman_fill(bits: Puint32; stride: longint; bpp: longint; x: longint; y: longint;
  width: longint; height: longint; _xor: uint32): Tpixman_bool; cdecl; external libpixman;
function pixman_version: longint; cdecl; external libpixman;
function pixman_version_string: pchar; cdecl; external libpixman;

type
  Tpixman_read_memory_func = function(src: pointer; size: longint): uint32; cdecl;
  Tpixman_write_memory_func = procedure(dst: pointer; value: uint32; size: longint); cdecl;
  Tpixman_image_destroy_func = procedure(image: Ppixman_image; data: pointer); cdecl;

  Tpixman_gradient_stop = record
    x: Tpixman_fixed;
    color: Tpixman_color;
  end;
  Ppixman_gradient_stop = ^Tpixman_gradient_stop;

const
  PIXMAN_MAX_INDEXED = 256;

type
  Ppixman_index_type = ^Tpixman_index_type;
  Tpixman_index_type = uint8;

type
  Tpixman_indexed = record
    color: Tpixman_bool;
    rgba: array[0..(PIXMAN_MAX_INDEXED) - 1] of uint32;
    ent: array[0..32767] of Tpixman_index_type;
  end;
  Ppixman_indexed = ^Tpixman_indexed;

const
  PIXMAN_TYPE_OTHER = 0;
  PIXMAN_TYPE_A = 1;
  PIXMAN_TYPE_ARGB = 2;
  PIXMAN_TYPE_ABGR = 3;
  PIXMAN_TYPE_COLOR = 4;
  PIXMAN_TYPE_GRAY = 5;
  PIXMAN_TYPE_YUY2 = 6;
  PIXMAN_TYPE_YV12 = 7;
  PIXMAN_TYPE_BGRA = 8;
  PIXMAN_TYPE_RGBA = 9;
  PIXMAN_TYPE_ARGB_SRGB = 10;
  PIXMAN_TYPE_RGBA_FLOAT = 11;

type
  PTpixman_format_code = ^TTpixman_format_code;
  TTpixman_format_code = DWord;

const
  { 128bpp formats }
  PIXMAN_rgba_float = $10CB4444;
  { 96bpp formats }
  PIXMAN_rgb_float = $0CCB0444;

  { 32bpp formats }
  PIXMAN_a8r8g8b8 = $20028888;
  PIXMAN_x8r8g8b8 = $20020888;
  PIXMAN_a8b8g8r8 = $20038888;
  PIXMAN_x8b8g8r8 = $20030888;
  PIXMAN_b8g8r8a8 = $20088888;
  PIXMAN_b8g8r8x8 = $20080888;
  PIXMAN_r8g8b8a8 = $20098888;
  PIXMAN_r8g8b8x8 = $20090888;
  PIXMAN_x14r6g6b6 = $20020666;
  PIXMAN_x2r10g10b10 = $20020AAA;
  PIXMAN_a2r10g10b10 = $20022AAA;
  PIXMAN_x2b10g10r10 = $20030AAA;
  PIXMAN_a2b10g10r10 = $20032AAA;

  { sRGB formats }
  PIXMAN_a8r8g8b8_sRGB = $200A8888;

  { 24bpp formats }
  PIXMAN_r8g8b8 = $18020888;
  PIXMAN_b8g8r8 = $18030888;

  { 16bpp formats }
  PIXMAN_r5g6b5 = $10020565;
  PIXMAN_b5g6r5 = $10030565;

  PIXMAN_a1r5g5b5 = $10021555;
  PIXMAN_x1r5g5b5 = $10020555;
  PIXMAN_a1b5g5r5 = $10031555;
  PIXMAN_x1b5g5r5 = $10030555;
  PIXMAN_a4r4g4b4 = $10024444;
  PIXMAN_x4r4g4b4 = $10020444;
  PIXMAN_a4b4g4r4 = $10034444;
  PIXMAN_x4b4g4r4 = $10030444;

  { 8bpp formats }
  PIXMAN_a8 = $08018000;
  PIXMAN_r3g3b2 = $08020332;
  PIXMAN_b2g3r3 = $08030233;

  PIXMAN_a2r2g2b2 = $08022222;
  PIXMAN_a2b2g2r2 = $08032222;

  PIXMAN_c8 = $08040000;
  PIXMAN_g8 = $08050000;

  PIXMAN_x4a4 = $08014000;

  PIXMAN_x4c4 = $08040000;
  PIXMAN_x4g4 = $08050000;

  { 4bpp formats }
  PIXMAN_a4 = $04014000;
  PIXMAN_r1g2b1 = $04020121;
  PIXMAN_b1g2r1 = $04030121;
  PIXMAN_a1r1g1b1 = $04021111;
  PIXMAN_a1b1g1r1 = $04031111;

  PIXMAN_c4 = $04040000;
  PIXMAN_g4 = $04050000;

  { 1bpp formats }
  PIXMAN_a1 = $01011000;
  PIXMAN_g1 = $01050000;

  { YUV formats }
  PIXMAN_yuy2 = $10060000;
  PIXMAN_yv12 = $0C070000;

function pixman_format_supported_destination(format: TTpixman_format_code): Tpixman_bool; cdecl; external libpixman;
function pixman_format_supported_source(format: TTpixman_format_code): Tpixman_bool; cdecl; external libpixman;
function pixman_image_create_solid_fill(color: Ppixman_color): Ppixman_image; cdecl; external libpixman;
function pixman_image_create_linear_gradient(p1: Ppixman_point_fixed; p2: Ppixman_point_fixed; stops: Ppixman_gradient_stop; n_stops: longint): Ppixman_image; cdecl; external libpixman;
function pixman_image_create_radial_gradient(inner: Ppixman_point_fixed; outer: Ppixman_point_fixed; inner_radius: Tpixman_fixed; outer_radius: Tpixman_fixed; stops: Ppixman_gradient_stop;
  n_stops: longint): Ppixman_image; cdecl; external libpixman;
function pixman_image_create_conical_gradient(center: Ppixman_point_fixed; angle: Tpixman_fixed; stops: Ppixman_gradient_stop; n_stops: longint): Ppixman_image; cdecl; external libpixman;
function pixman_image_create_bits(format: TTpixman_format_code; width: longint; height: longint; bits: Puint32; rowstride_bytes: longint): Ppixman_image; cdecl; external libpixman;
function pixman_image_create_bits_no_clear(format: TTpixman_format_code; width: longint; height: longint; bits: Puint32; rowstride_bytes: longint): Ppixman_image; cdecl; external libpixman;
function pixman_image_ref(image: Ppixman_image): Ppixman_image; cdecl; external libpixman;
function pixman_image_unref(image: Ppixman_image): Tpixman_bool; cdecl; external libpixman;
procedure pixman_image_set_destroy_function(image: Ppixman_image; _function: Tpixman_image_destroy_func; data: pointer); cdecl; external libpixman;
function pixman_image_get_destroy_data(image: Ppixman_image): pointer; cdecl; external libpixman;
function pixman_image_set_clip_region(image: Ppixman_image; region: Ppixman_region16): Tpixman_bool; cdecl; external libpixman;
function pixman_image_set_clip_region32(image: Ppixman_image; region: Ppixman_region32): Tpixman_bool; cdecl; external libpixman;
procedure pixman_image_set_has_client_clip(image: Ppixman_image; clien_clip: Tpixman_bool); cdecl; external libpixman;
function pixman_image_set_transform(image: Ppixman_image; transform: Ppixman_transform): Tpixman_bool; cdecl; external libpixman;
procedure pixman_image_set_repeat(image: Ppixman_image; _repeat: Tpixman_repeat); cdecl; external libpixman;
procedure pixman_image_set_dither(image: Ppixman_image; dither: Tpixman_dither); cdecl; external libpixman;
procedure pixman_image_set_dither_offset(image: Ppixman_image; offset_x: longint; offset_y: longint); cdecl; external libpixman;
function pixman_image_set_filter(image: Ppixman_image; filter: Tpixman_filter; filter_params: Ppixman_fixed; n_filter_params: longint): Tpixman_bool; cdecl; external libpixman;
procedure pixman_image_set_source_clipping(image: Ppixman_image; source_clipping: Tpixman_bool); cdecl; external libpixman;
procedure pixman_image_set_alpha_map(image: Ppixman_image; alpha_map: Ppixman_image; x: int16; y: int16); cdecl; external libpixman;
procedure pixman_image_set_component_alpha(image: Ppixman_image; component_alpha: Tpixman_bool); cdecl; external libpixman;
function pixman_image_get_component_alpha(image: Ppixman_image): Tpixman_bool; cdecl; external libpixman;
procedure pixman_image_set_accessors(image: Ppixman_image; read_func: Tpixman_read_memory_func; write_func: Tpixman_write_memory_func); cdecl; external libpixman;
procedure pixman_image_set_indexed(image: Ppixman_image; indexed: Ppixman_indexed); cdecl; external libpixman;
function pixman_image_get_data(image: Ppixman_image): Puint32; cdecl; external libpixman;
function pixman_image_get_width(image: Ppixman_image): longint; cdecl; external libpixman;
function pixman_image_get_height(image: Ppixman_image): longint; cdecl; external libpixman;
function pixman_image_get_stride(image: Ppixman_image): longint; cdecl; external libpixman;
function pixman_image_get_depth(image: Ppixman_image): longint; cdecl; external libpixman;
function pixman_image_get_format(image: Ppixman_image): TTpixman_format_code; cdecl; external libpixman;

type
  Ppixman_kernel = ^Tpixman_kernel;
  Tpixman_kernel = longint;

const
  PIXMAN_KERNEL_IMPULSE = 0;
  PIXMAN_KERNEL_BOX = 1;
  PIXMAN_KERNEL_LINEAR = 2;
  PIXMAN_KERNEL_CUBIC = 3;
  PIXMAN_KERNEL_GAUSSIAN = 4;
  PIXMAN_KERNEL_LANCZOS2 = 5;
  PIXMAN_KERNEL_LANCZOS3 = 6;
  PIXMAN_KERNEL_LANCZOS3_STRETCHED = 7;

function pixman_filter_create_separable_convolution(n_values: Plongint; scale_x: Tpixman_fixed; scale_y: Tpixman_fixed; reconstruct_x: Tpixman_kernel; reconstruct_y: Tpixman_kernel;
  sample_x: Tpixman_kernel; sample_y: Tpixman_kernel; subsample_bits_x: longint; subsample_bits_y: longint): Ppixman_fixed; cdecl; external libpixman;
function pixman_image_fill_rectangles(op: Tpixman_op; image: Ppixman_image; color: Ppixman_color; n_rects: longint; rects: Ppixman_rectangle16): Tpixman_bool; cdecl; external libpixman;
function pixman_image_fill_boxes(op: Tpixman_op; dest: Ppixman_image; color: Ppixman_color; n_boxes: longint; boxes: Ppixman_box32): Tpixman_bool; cdecl; external libpixman;
function pixman_compute_composite_region(region: Ppixman_region16; src_image: Ppixman_image; mask_image: Ppixman_image; dest_image: Ppixman_image; src_x: int16;
  src_y: int16; mask_x: int16; mask_y: int16; dest_x: int16; dest_y: int16;
  width: uint16; height: uint16): Tpixman_bool; cdecl; external libpixman;
procedure pixman_image_composite(op: Tpixman_op; src: Ppixman_image; mask: Ppixman_image; dest: Ppixman_image; src_x: int16;
  src_y: int16; mask_x: int16; mask_y: int16; dest_x: int16; dest_y: int16;
  width: uint16; height: uint16); cdecl; external libpixman;
procedure pixman_image_composite32(op: Tpixman_op; src: Ppixman_image; mask: Ppixman_image; dest: Ppixman_image; src_x: int32;
  src_y: int32; mask_x: int32; mask_y: int32; dest_x: int32; dest_y: int32;
  width: int32; height: int32); cdecl; external libpixman;
procedure pixman_disable_out_of_bounds_workaround; cdecl; external libpixman;

type
  Tpixman_glyph_cache = record
  end;
  Ppixman_glyph_cache = ^Tpixman_glyph_cache;

  Tpixman_glyph = record
    x: longint;
    y: longint;
    glyph: pointer;
  end;
  Ppixman_glyph = ^Tpixman_glyph;

function pixman_glyph_cache_create: Ppixman_glyph_cache; cdecl; external libpixman;
procedure pixman_glyph_cache_destroy(cache: Ppixman_glyph_cache); cdecl; external libpixman;
procedure pixman_glyph_cache_freeze(cache: Ppixman_glyph_cache); cdecl; external libpixman;
procedure pixman_glyph_cache_thaw(cache: Ppixman_glyph_cache); cdecl; external libpixman;
function pixman_glyph_cache_lookup(cache: Ppixman_glyph_cache; font_key: pointer; glyph_key: pointer): pointer; cdecl; external libpixman;
function pixman_glyph_cache_insert(cache: Ppixman_glyph_cache; font_key: pointer; glyph_key: pointer; origin_x: longint; origin_y: longint;
  glyph_image: Ppixman_image): pointer; cdecl; external libpixman;
procedure pixman_glyph_cache_remove(cache: Ppixman_glyph_cache; font_key: pointer; glyph_key: pointer); cdecl; external libpixman;
procedure pixman_glyph_get_extents(cache: Ppixman_glyph_cache; n_glyphs: longint; glyphs: Ppixman_glyph; extents: Ppixman_box32); cdecl; external libpixman;
function pixman_glyph_get_mask_format(cache: Ppixman_glyph_cache; n_glyphs: longint; glyphs: Ppixman_glyph): TTpixman_format_code; cdecl; external libpixman;
procedure pixman_composite_glyphs(op: Tpixman_op; src: Ppixman_image; dest: Ppixman_image; mask_format: TTpixman_format_code; src_x: int32;
  src_y: int32; mask_x: int32; mask_y: int32; dest_x: int32; dest_y: int32;
  width: int32; height: int32; cache: Ppixman_glyph_cache; n_glyphs: longint; glyphs: Ppixman_glyph); cdecl; external libpixman;
procedure pixman_composite_glyphs_no_mask(op: Tpixman_op; src: Ppixman_image; dest: Ppixman_image; src_x: int32; src_y: int32;
  dest_x: int32; dest_y: int32; cache: Ppixman_glyph_cache; n_glyphs: longint; glyphs: Ppixman_glyph); cdecl; external libpixman;

type
  Tpixman_edge = record
    x: Tpixman_fixed;
    e: Tpixman_fixed;
    stepx: Tpixman_fixed;
    signdx: Tpixman_fixed;
    dy: Tpixman_fixed;
    dx: Tpixman_fixed;
    stepx_small: Tpixman_fixed;
    stepx_big: Tpixman_fixed;
    dx_small: Tpixman_fixed;
    dx_big: Tpixman_fixed;
  end;
  Ppixman_edge = ^Tpixman_edge;

  Tpixman_trapezoid = record
    top: Tpixman_fixed;
    bottom: Tpixman_fixed;
    left: Tpixman_line_fixed;
    right: Tpixman_line_fixed;
  end;
  Ppixman_trapezoid = ^Tpixman_trapezoid;

  Tpixman_triangle = record
    p1: Tpixman_point_fixed;
    p2: Tpixman_point_fixed;
    p3: Tpixman_point_fixed;
  end;
  Ppixman_triangle = ^Tpixman_triangle;

  Tpixman_span_fix = record
    l: Tpixman_fixed;
    r: Tpixman_fixed;
    y: Tpixman_fixed;
  end;
  Ppixman_span_fix = ^Tpixman_span_fix;

  Tpixman_trap = record
    top: Tpixman_span_fix;
    bot: Tpixman_span_fix;
  end;
  Ppixman_trap = ^Tpixman_trap;


function pixman_sample_ceil_y(y: Tpixman_fixed; bpp: longint): Tpixman_fixed; cdecl; external libpixman;
function pixman_sample_floor_y(y: Tpixman_fixed; bpp: longint): Tpixman_fixed; cdecl; external libpixman;
procedure pixman_edge_step(e: Ppixman_edge; n: longint); cdecl; external libpixman;
procedure pixman_edge_init(e: Ppixman_edge; bpp: longint; y_start: Tpixman_fixed; x_top: Tpixman_fixed; y_top: Tpixman_fixed;
  x_bot: Tpixman_fixed; y_bot: Tpixman_fixed); cdecl; external libpixman;
procedure pixman_line_fixed_edge_init(e: Ppixman_edge; bpp: longint; y: Tpixman_fixed; line: Ppixman_line_fixed; x_off: longint;
  y_off: longint); cdecl; external libpixman;
procedure pixman_rasterize_edges(image: Ppixman_image; l: Ppixman_edge; r: Ppixman_edge; t: Tpixman_fixed; b: Tpixman_fixed); cdecl; external libpixman;
procedure pixman_add_traps(image: Ppixman_image; x_off: int16; y_off: int16; ntrap: longint; traps: Ppixman_trap); cdecl; external libpixman;
procedure pixman_add_trapezoids(image: Ppixman_image; x_off: int16; y_off: longint; ntraps: longint; traps: Ppixman_trapezoid); cdecl; external libpixman;
procedure pixman_rasterize_trapezoid(image: Ppixman_image; trap: Ppixman_trapezoid; x_off: longint; y_off: longint); cdecl; external libpixman;
procedure pixman_composite_trapezoids(op: Tpixman_op; src: Ppixman_image; dst: Ppixman_image; mask_format: TTpixman_format_code; x_src: longint;
  y_src: longint; x_dst: longint; y_dst: longint; n_traps: longint; traps: Ppixman_trapezoid); cdecl; external libpixman;
procedure pixman_composite_triangles(op: Tpixman_op; src: Ppixman_image; dst: Ppixman_image; mask_format: TTpixman_format_code; x_src: longint;
  y_src: longint; x_dst: longint; y_dst: longint; n_tris: longint; tris: Ppixman_triangle); cdecl; external libpixman;
procedure pixman_add_triangles(image: Ppixman_image; x_off: int32; y_off: int32; n_tris: longint; tris: Ppixman_triangle); cdecl; external libpixman;

// === Konventiert am: 27-5-25 12:47:59 ===


implementation

function Tpixman_fixedo_int(f: Tpixman_fixed): integer;
begin
  Result := f shr 16;
end;

function pixman_int_to_fixed(i: integer): Tpixman_fixed;
begin
  Result := i shl 16;
end;

function Tpixman_fixedo_double(f: Tpixman_fixed): double;
begin
  Result := f / pixman_fixed_1;
end;

function pixman_double_to_fixed(d: double): Tpixman_fixed;
begin
  Result := Round(d * 65536.0);
end;

function pixman_fixed_frac(f: Tpixman_fixed): Tpixman_fixed;
begin
  Result := f and pixman_fixed_1_minus_e;
end;

function pixman_fixed_floor(f: Tpixman_fixed): Tpixman_fixed;
begin
  Result := f and not pixman_fixed_1_minus_e;
end;

function pixman_fixed_ceil(f: Tpixman_fixed): Tpixman_fixed;
begin
  Result := pixman_fixed_floor(f + pixman_fixed_1_minus_e);
end;

function pixman_fixed_fraction(f: Tpixman_fixed): Tpixman_fixed;
begin
  Result := f and pixman_fixed_1_minus_e;
end;

function pixman_fixed_mod_2(f: Tpixman_fixed): Tpixman_fixed;
begin
  Result := f and (pixman_fixed_1 or pixman_fixed_1_minus_e);
end;


end.
