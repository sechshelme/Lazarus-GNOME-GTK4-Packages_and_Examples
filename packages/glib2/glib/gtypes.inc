
{$IFDEF read_interface}

type
  TGCompareFunc = function(a: Tgconstpointer; b: Tgconstpointer): Tgint; cdecl;
  TGCompareDataFunc = function(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgint; cdecl;
  TGEqualFunc = function(a: Tgconstpointer; b: Tgconstpointer): Tgboolean; cdecl;
  TGEqualFuncFull = function(a: Tgconstpointer; b: Tgconstpointer; user_data: Tgpointer): Tgboolean; cdecl;
  TGDestroyNotify = procedure(Data: Tgpointer); cdecl;
  PGDestroyNotify = ^TGDestroyNotify;
  TGFunc = procedure(Data: Tgpointer; user_data: Tgpointer); cdecl;
  TGHashFunc = function(key: Tgconstpointer): Tguint; cdecl;
  TGHFunc = procedure(key: Tgpointer; Value: Tgpointer; user_data: Tgpointer); cdecl;
  TGCopyFunc = function(src: Tgconstpointer; Data: Tgpointer): Tgpointer; cdecl;
  TGFreeFunc = procedure(Data: Tgpointer); cdecl;
  TGTranslateFunc = function(str: Pgchar; Data: Tgpointer): Pgchar; cdecl;
  PGTranslateFunc = ^TGTranslateFunc;

const
  G_E = 2.7182818284590452353602874713526624977572470937000;
  G_LN2 = 0.69314718055994530941723212145817656807550013436026;
  G_LN10 = 2.3025850929940456840179914546843642076011014886288;
  G_PI = 3.1415926535897932384626433832795028841971693993751;
  G_PI_2 = 1.5707963267948966192313216916397514420985846996876;
  G_PI_4 = 0.78539816339744830961566084581987572104929234984378;
  G_SQRT2 = 1.4142135623730950488016887242096980785696718753769;

const
  G_IEEE754_FLOAT_BIAS = 127;
  G_IEEE754_DOUBLE_BIAS = 1023;
  G_LOG_2_BASE_10 = 0.30102999566398119521;

type
  PGFloatIEEE754 = ^TGFloatIEEE754;
  TGFloatIEEE754 = record
    case longint of
      0: (v_float: Tgfloat);
      1: (mpn: record
          flag0: longint;
          end);
  end;


const
  bm_TGFloatIEEE754_mantissa = $7FFFFF;
  bp_TGFloatIEEE754_mantissa = 0;
  bm_TGFloatIEEE754_biased_exponent = $7F800000;
  bp_TGFloatIEEE754_biased_exponent = 23;
  bm_TGFloatIEEE754_sign = $80000000;
  bp_TGFloatIEEE754_sign = 31;

type
  PGDoubleIEEE754 = ^TGDoubleIEEE754;
  TGDoubleIEEE754 = record
    case longint of
      0: (v_double: Tgdouble);
      1: (mpn: record
          flag0: longint;
          flag1: longint;
          end);
  end;


const
  bm_TGDoubleIEEE754_mantissa_low = $FFFFFFFF;
  bp_TGDoubleIEEE754_mantissa_low = 0;
  bm_TGDoubleIEEE754_mantissa_high = $FFFFF;
  bp_TGDoubleIEEE754_mantissa_high = 0;
  bm_TGDoubleIEEE754_biased_exponent = $7FF00000;
  bp_TGDoubleIEEE754_biased_exponent = 20;
  bm_TGDoubleIEEE754_sign = $80000000;
  bp_TGDoubleIEEE754_sign = 31;

type
  TGTimeVal = record
    tv_sec: Tglong;
    tv_usec: Tglong;
  end;
  PGTimeVal = ^TGTimeVal;

  Tgrefcount = Tgint;
  Pgrefcount = ^Tgrefcount;

  Tgatomicrefcount = Tgint;
  Pgatomicrefcount = ^Tgatomicrefcount;

  // === Konventiert am: 6-8-24 15:51:59 ===

function GUINT16_SWAP_LE_BE_CONSTANT(val: Tguint16): Tguint16;
function GUINT32_SWAP_LE_BE_CONSTANT(val: Tguint32): Tguint32;
function GUINT64_SWAP_LE_BE_CONSTANT(val: Tguint64): Tguint64;

function GUINT16_SWAP_LE_BE(val : Tguint16) : Tguint16;
function GUINT32_SWAP_LE_BE(val : Tguint32) : Tguint32;
function GUINT64_SWAP_LE_BE(val : Tguint64) : Tguint64;

function GUINT16_SWAP_LE_PDP(val : Tguint16) : Tguint16;
function GUINT16_SWAP_BE_PDP(val : Tguint16) : Tguint16;

function GUINT32_SWAP_LE_PDP(val : Tguint32) : Tguint32;
function GUINT32_SWAP_BE_PDP(val : Tguint32) : Tguint32;

function GINT16_FROM_LE(val : Tgint16) : Tgint16;
function GUINT16_FROM_LE(val : Tguint16) : Tguint16;
function GINT16_FROM_BE(val : Tgint16) : Tgint16;
function GUINT16_FROM_BE(val : Tguint16) : Tguint16;

function GINT32_FROM_LE(val : Tgint32) : Tgint32;
function GUINT32_FROM_LE(val : Tguint32) : Tguint32;
function GINT32_FROM_BE(val : Tgint32) : Tgint32;
function GUINT32_FROM_BE(val : Tguint32) : Tguint32;

function GINT64_FROM_LE(val : Tgint64) : Tgint64;
function GUINT64_FROM_LE(val : Tguint64) : Tguint64;
function GINT64_FROM_BE(val : Tgint64) : Tgint64;
function GUINT64_FROM_BE(val : Tguint64) : Tguint64;

function GLONG_FROM_LE(val : Tglong) : Tglong;
function GULONG_FROM_LE(val : Tgulong) : Tgulong;
function GLONG_FROM_BE(val : Tglong) : Tglong;
function GULONG_FROM_BE(val : Tgulong) : Tgulong;

function GINT_FROM_LE(val : Tgint) : Tgint;
function GUINT_FROM_LE(val : Tguint) : Tguint;
function GINT_FROM_BE(val : Tgint) : Tgint;
function GUINT_FROM_BE(val : Tguint) : Tguint;

function GSIZE_FROM_LE(val : Tgsize) : Tgsize;
function GSSIZE_FROM_LE(val : Tgssize) : Tgssize;
function GSIZE_FROM_BE(val : Tgsize) : Tgsize;
function GSSIZE_FROM_BE(val : Tgssize) : Tgssize;

function g_ntohl(val : Tguint32) : Tguint32;
function g_ntohs(val : Tguint16) : Tguint16;
function g_htonl(val : Tguint32) : Tguint32;
function g_htons(val : Tguint16) : Tguint16;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GUINT16_SWAP_LE_BE_CONSTANT(val: Tguint16): Tguint16;
begin
  Result := ((val and $ff) shl 8) or ((val and $ff00) shr 8);
end;

function GUINT32_SWAP_LE_BE_CONSTANT(val: Tguint32): Tguint32;
begin
  Result :=
    ((val and $000000ff) shl 24) or
    ((val and $0000ff00) shl 8) or
    ((val and $00ff0000) shr 8) or
    ((val and $ff000000) shr 24);
end;

function GUINT64_SWAP_LE_BE_CONSTANT(val: Tguint64): Tguint64;
begin
  Result :=
    ((val and $00000000000000ff) shl 56) or
    ((val and $000000000000ff00) shl 40) or
    ((val and $0000000000ff0000) shl 24) or
    ((val and $00000000ff000000) shl 8) or

    ((val and $00000000000000ff00000000) shr 8) or
    ((val and $000000000000ff0000000000) shr 24) or
    ((val and $0000000000ff000000000000) shr 40) or
    ((val and $00000000ff00000000000000) shr 56);
end;

// ====

function GUINT16_SWAP_LE_BE(val: Tguint16): Tguint16;
begin
  GUINT16_SWAP_LE_BE:=GUINT16_SWAP_LE_BE_CONSTANT(val);
end;

function GUINT32_SWAP_LE_BE(val: Tguint32): Tguint32;
begin
  GUINT32_SWAP_LE_BE:=GUINT32_SWAP_LE_BE_CONSTANT(val);
end;

function GUINT64_SWAP_LE_BE(val: Tguint64): Tguint64;
begin
  GUINT64_SWAP_LE_BE:=GUINT64_SWAP_LE_BE_CONSTANT(val);
end;

// =====

function GUINT16_SWAP_LE_PDP(val : Tguint16) : Tguint16;
begin
  GUINT16_SWAP_LE_PDP:=Tguint16(val);
end;

function GUINT16_SWAP_BE_PDP(val: Tguint16): Tguint16;
begin
  GUINT16_SWAP_BE_PDP:=GUINT16_SWAP_LE_BE(val);
end;

function GUINT32_SWAP_LE_PDP(val: Tguint32): Tguint32;
begin
  GUINT32_SWAP_LE_PDP := Tguint32(((val and $0000ffff) shl 16) or ((val and $ffff0000) shr 16));
end;

function GUINT32_SWAP_BE_PDP(val: Tguint32): Tguint32;
begin
  GUINT32_SWAP_BE_PDP := Tguint32(((val and $00ff00ff) shl 8) or ((val and $ff00ff00) shr 8));
end;

function GINT16_FROM_LE(val: Tgint16): Tgint16;
begin
  GINT16_FROM_LE:=GINT16_TO_LE(val);
end;

function GUINT16_FROM_LE(val: Tguint16): Tguint16;
begin
  GUINT16_FROM_LE:=GUINT16_TO_LE(val);
end;

function GINT16_FROM_BE(val: Tgint16): Tgint16;
begin
  GINT16_FROM_BE:=GINT16_TO_BE(val);
end;

function GUINT16_FROM_BE(val: Tguint16): Tguint16;
begin
  GUINT16_FROM_BE:=GUINT16_TO_BE(val);
end;

function GINT32_FROM_LE(val: Tgint32): Tgint32;
begin
  GINT32_FROM_LE:=GINT32_TO_LE(val);
end;

function GUINT32_FROM_LE(val: Tguint32): Tguint32;
begin
  GUINT32_FROM_LE:=GUINT32_TO_LE(val);
end;

function GINT32_FROM_BE(val: Tgint32): Tgint32;
begin
  GINT32_FROM_BE:=GINT32_TO_BE(val);
end;

function GUINT32_FROM_BE(val: Tguint32): Tguint32;
begin
  GUINT32_FROM_BE:=GUINT32_TO_BE(val);
end;

function GINT64_FROM_LE(val: Tgint64): Tgint64;
begin
  GINT64_FROM_LE:=GINT64_TO_LE(val);
end;

function GUINT64_FROM_LE(val: Tguint64): Tguint64;
begin
  GUINT64_FROM_LE:=GUINT64_TO_LE(val);
end;

function GINT64_FROM_BE(val: Tgint64): Tgint64;
begin
  GINT64_FROM_BE:=GINT64_TO_BE(val);
end;

function GUINT64_FROM_BE(val: Tguint64): Tguint64;
begin
  GUINT64_FROM_BE:=GUINT64_TO_BE(val);
end;

function GLONG_FROM_LE(val: Tglong): Tglong;
begin
  GLONG_FROM_LE:=GLONG_TO_LE(val);
end;

function GULONG_FROM_LE(val: Tgulong): Tgulong;
begin
  GULONG_FROM_LE:=GULONG_TO_LE(val);
end;

function GLONG_FROM_BE(val: Tglong): Tglong;
begin
  GLONG_FROM_BE:=GLONG_TO_BE(val);
end;

function GULONG_FROM_BE(val: Tgulong): Tgulong;
begin
  GULONG_FROM_BE:=GULONG_TO_BE(val);
end;

function GINT_FROM_LE(val: Tgint): Tgint;
begin
  GINT_FROM_LE:=GINT_TO_LE(val);
end;

function GUINT_FROM_LE(val: Tguint): Tguint;
begin
  GUINT_FROM_LE:=GUINT_TO_LE(val);
end;

function GINT_FROM_BE(val: Tgint): Tgint;
begin
  GINT_FROM_BE:=GINT_TO_BE(val);
end;

function GUINT_FROM_BE(val: Tguint): Tguint;
begin
  GUINT_FROM_BE:=GUINT_TO_BE(val);
end;

function GSIZE_FROM_LE(val: Tgsize): Tgsize;
begin
  GSIZE_FROM_LE:=GSIZE_TO_LE(val);
end;

function GSSIZE_FROM_LE(val: Tgssize): Tgssize;
begin
  GSSIZE_FROM_LE:=GSSIZE_TO_LE(val);
end;

function GSIZE_FROM_BE(val: Tgsize): Tgsize;
begin
  GSIZE_FROM_BE:=GSIZE_TO_BE(val);
end;

function GSSIZE_FROM_BE(val: Tgssize): Tgssize;
begin
  GSSIZE_FROM_BE:=GSSIZE_TO_BE(val);
end;

function g_ntohl(val: Tguint32): Tguint32;
begin
  g_ntohl:=GUINT32_FROM_BE(val);
end;

function g_ntohs(val: Tguint16): Tguint16;
begin
  g_ntohs:=GUINT16_FROM_BE(val);
end;

function g_htonl(val: Tguint32): Tguint32;
begin
  g_htonl:=GUINT32_TO_BE(val);
end;

function g_htons(val: Tguint16): Tguint16;
begin
  g_htons:=GUINT16_TO_BE(val);
end;


{$ENDIF read_implementation}
