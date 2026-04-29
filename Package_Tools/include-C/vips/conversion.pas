unit conversion;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips,arithmetic, image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PVipsExtend = ^TVipsExtend;
  TVipsExtend = longint;

const
  VIPS_EXTEND_BLACK = 0;
  VIPS_EXTEND_COPY = 1;
  VIPS_EXTEND_REPEAT = 2;
  VIPS_EXTEND_MIRROR = 3;
  VIPS_EXTEND_WHITE = 4;
  VIPS_EXTEND_BACKGROUND = 5;
  VIPS_EXTEND_LAST = 6;

type
  PVipsCompassDirection = ^TVipsCompassDirection;
  TVipsCompassDirection = longint;

const
  VIPS_COMPASS_DIRECTION_CENTRE = 0;
  VIPS_COMPASS_DIRECTION_NORTH = 1;
  VIPS_COMPASS_DIRECTION_EAST = 2;
  VIPS_COMPASS_DIRECTION_SOUTH = 3;
  VIPS_COMPASS_DIRECTION_WEST = 4;
  VIPS_COMPASS_DIRECTION_NORTH_EAST = 5;
  VIPS_COMPASS_DIRECTION_SOUTH_EAST = 6;
  VIPS_COMPASS_DIRECTION_SOUTH_WEST = 7;
  VIPS_COMPASS_DIRECTION_NORTH_WEST = 8;
  VIPS_COMPASS_DIRECTION_LAST = 9;

type
  PVipsDirection = ^TVipsDirection;
  TVipsDirection = longint;

const
  VIPS_DIRECTION_HORIZONTAL = 0;
  VIPS_DIRECTION_VERTICAL = 1;
  VIPS_DIRECTION_LAST = 2;

type
  PVipsAlign = ^TVipsAlign;
  TVipsAlign = longint;

const
  VIPS_ALIGN_LOW = 0;
  VIPS_ALIGN_CENTRE = 1;
  VIPS_ALIGN_HIGH = 2;
  VIPS_ALIGN_LAST = 3;

type
  PVipsAngle = ^TVipsAngle;
  TVipsAngle = longint;

const
  VIPS_ANGLE_D0 = 0;
  VIPS_ANGLE_D90 = 1;
  VIPS_ANGLE_D180 = 2;
  VIPS_ANGLE_D270 = 3;
  VIPS_ANGLE_LAST = 4;

type
  PVipsAngle45 = ^TVipsAngle45;
  TVipsAngle45 = longint;

const
  VIPS_ANGLE45_D0 = 0;
  VIPS_ANGLE45_D45 = 1;
  VIPS_ANGLE45_D90 = 2;
  VIPS_ANGLE45_D135 = 3;
  VIPS_ANGLE45_D180 = 4;
  VIPS_ANGLE45_D225 = 5;
  VIPS_ANGLE45_D270 = 6;
  VIPS_ANGLE45_D315 = 7;
  VIPS_ANGLE45_LAST = 8;

type
  PVipsInteresting = ^TVipsInteresting;
  TVipsInteresting = longint;

const
  VIPS_INTERESTING_NONE = 0;
  VIPS_INTERESTING_CENTRE = 1;
  VIPS_INTERESTING_ENTROPY = 2;
  VIPS_INTERESTING_ATTENTION = 3;
  VIPS_INTERESTING_LOW = 4;
  VIPS_INTERESTING_HIGH = 5;
  VIPS_INTERESTING_ALL = 6;
  VIPS_INTERESTING_LAST = 7;

type
  PVipsBlendMode = ^TVipsBlendMode;
  TVipsBlendMode = longint;

const
  VIPS_BLEND_MODE_CLEAR = 0;
  VIPS_BLEND_MODE_SOURCE = 1;
  VIPS_BLEND_MODE_OVER = 2;
  VIPS_BLEND_MODE_IN = 3;
  VIPS_BLEND_MODE_OUT = 4;
  VIPS_BLEND_MODE_ATOP = 5;
  VIPS_BLEND_MODE_DEST = 6;
  VIPS_BLEND_MODE_DEST_OVER = 7;
  VIPS_BLEND_MODE_DEST_IN = 8;
  VIPS_BLEND_MODE_DEST_OUT = 9;
  VIPS_BLEND_MODE_DEST_ATOP = 10;
  VIPS_BLEND_MODE_XOR = 11;
  VIPS_BLEND_MODE_ADD = 12;
  VIPS_BLEND_MODE_SATURATE = 13;
  VIPS_BLEND_MODE_MULTIPLY = 14;
  VIPS_BLEND_MODE_SCREEN = 15;
  VIPS_BLEND_MODE_OVERLAY = 16;
  VIPS_BLEND_MODE_DARKEN = 17;
  VIPS_BLEND_MODE_LIGHTEN = 18;
  VIPS_BLEND_MODE_COLOUR_DODGE = 19;
  VIPS_BLEND_MODE_COLOUR_BURN = 20;
  VIPS_BLEND_MODE_HARD_LIGHT = 21;
  VIPS_BLEND_MODE_SOFT_LIGHT = 22;
  VIPS_BLEND_MODE_DIFFERENCE = 23;
  VIPS_BLEND_MODE_EXCLUSION = 24;
  VIPS_BLEND_MODE_LAST = 25;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_copy(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_tilecache(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_linecache(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_sequential(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cache(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_copy_file(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_embed(in_: PVipsImage; out_: PPVipsImage; x: longint; y: longint; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_gravity(in_: PVipsImage; out_: PPVipsImage; direction: TVipsCompassDirection; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_flip(in_: PVipsImage; out_: PPVipsImage; direction: TVipsDirection): longint; varargs; cdecl; external libvips;
function vips_insert(main_: PVipsImage; sub: PVipsImage; out_: PPVipsImage; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_join(in1: PVipsImage; in2: PVipsImage; out_: PPVipsImage; direction: TVipsDirection): longint; varargs; cdecl; external libvips;
function vips_arrayjoin(in_: PPVipsImage; out_: PPVipsImage; n: longint): longint; varargs; cdecl; external libvips;
function vips_extract_area(in_: PVipsImage; out_: PPVipsImage; left: longint; top: longint; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_crop(in_: PVipsImage; out_: PPVipsImage; left: longint; top: longint; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_smartcrop(in_: PVipsImage; out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_extract_band(in_: PVipsImage; out_: PPVipsImage; band: longint): longint; varargs; cdecl; external libvips;
function vips_replicate(in_: PVipsImage; out_: PPVipsImage; across: longint; down: longint): longint; varargs; cdecl; external libvips;
function vips_grid(in_: PVipsImage; out_: PPVipsImage; tile_height: longint; across: longint; down: longint): longint; varargs; cdecl; external libvips;
function vips_transpose3d(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_wrap(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rot(in_: PVipsImage; out_: PPVipsImage; angle: TVipsAngle): longint; varargs; cdecl; external libvips;
function vips_rot90(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rot180(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rot270(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rot45(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
procedure vips_autorot_remove_angle(image: PVipsImage); cdecl; external libvips;
function vips_autorot(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_zoom(in_: PVipsImage; out_: PPVipsImage; xfac: longint; yfac: longint): longint; varargs; cdecl; external libvips;
function vips_subsample(in_: PVipsImage; out_: PPVipsImage; xfac: longint; yfac: longint): longint; varargs; cdecl; external libvips;
function vips_cast(in_: PVipsImage; out_: PPVipsImage; format: TVipsBandFormat): longint; varargs; cdecl; external libvips;
function vips_cast_uchar(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_char(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_ushort(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_short(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_uint(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_int(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_float(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_double(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_complex(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cast_dpcomplex(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_scale(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_msb(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_byteswap(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_bandjoin(in_: PPVipsImage; out_: PPVipsImage; n: longint): longint; varargs; cdecl; external libvips;
function vips_bandjoin2(in1: PVipsImage; in2: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_bandjoin_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_bandjoin_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_bandrank(in_: PPVipsImage; out_: PPVipsImage; n: longint): longint; varargs; cdecl; external libvips;
function vips_bandfold(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_bandunfold(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_bandbool(in_: PVipsImage; out_: PPVipsImage; boolean: TVipsOperationBoolean): longint; varargs; cdecl; external libvips;
function vips_bandand(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_bandor(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_bandeor(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_bandmean(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_recomb(in_: PVipsImage; out_: PPVipsImage; m: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_ifthenelse(cond: PVipsImage; in1: PVipsImage; in2: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_switch(tests: PPVipsImage; out_: PPVipsImage; n: longint): longint; varargs; cdecl; external libvips;
function vips_flatten(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_addalpha(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_premultiply(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_unpremultiply(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_composite(in_: PPVipsImage; out_: PPVipsImage; n: longint; mode: Plongint): longint; varargs; cdecl; external libvips;
function vips_composite2(base: PVipsImage; overlay: PVipsImage; out_: PPVipsImage; mode: TVipsBlendMode): longint; varargs; cdecl; external libvips;
function vips_falsecolour(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_gamma(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:14:48 ===


implementation



end.
