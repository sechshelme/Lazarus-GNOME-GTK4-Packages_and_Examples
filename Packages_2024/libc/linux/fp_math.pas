unit fp_math;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/math.h

const
  HUGE_VAL = 1e10000;

const
  FP_INT_UPWARD = 0;
  FP_INT_DOWNWARD = 1;
  FP_INT_TOWARDZERO = 2;
  FP_INT_TONEARESTFROMZERO = 3;
  FP_INT_TONEAREST = 4;

var
  signgam: longint; cvar;external libm;

const
  FP_NAN = 0;
  FP_INFINITE = 1;
  FP_ZERO = 2;
  FP_SUBNORMAL = 3;
  FP_NORMAL = 4;

const
  M_E = 2.7182818284590452354;
  M_LOG2E = 1.4426950408889634074;
  M_LOG10E = 0.43429448190325182765;
  M_LN2 = 0.69314718055994530942;
  M_LN10 = 2.30258509299404568402;
  M_PI = 3.14159265358979323846;
  M_PI_2 = 1.57079632679489661923;
  M_PI_4 = 0.78539816339744830962;
  M_1_PI = 0.31830988618379067154;
  M_2_PI = 0.63661977236758134308;
  M_2_SQRTPI = 1.12837916709551257390;
  M_SQRT2 = 1.41421356237309504880;
  M_SQRT1_2 = 0.70710678118654752440;

const
  M_Ef = 2.7182818284590452354;
  M_LOG2Ef = 1.4426950408889634074;
  M_LOG10Ef = 0.43429448190325182765;
  M_LN2f = 0.69314718055994530942;
  M_LN10f = 2.30258509299404568402;
  M_PIf = 3.14159265358979323846;
  M_PI_2f = 1.57079632679489661923;
  M_PI_4f = 0.78539816339744830962;
  M_1_PIf = 0.31830988618379067154;
  M_2_PIf = 0.63661977236758134308;
  M_2_SQRTPIf = 1.12837916709551257390;
  M_SQRT2f = 1.41421356237309504880;
  M_SQRT1_2f = 0.70710678118654752440;

const
  M_El = 2.718281828459045235360287471352662498;
  M_LOG2El = 1.442695040888963407359924681001892137;
  M_LOG10El = 0.434294481903251827651128918916605082;
  M_LN2l = 0.693147180559945309417232121458176568;
  M_LN10l = 2.302585092994045684017991454684364208;
  M_PIl = 3.141592653589793238462643383279502884;
  M_PI_2l = 1.570796326794896619231321691639751442;
  M_PI_4l = 0.785398163397448309615660845819875721;
  M_1_PIl = 0.318309886183790671537767526745028724;
  M_2_PIl = 0.636619772367581343075535053490057448;
  M_2_SQRTPIl = 1.128379167095512573896158903121545172;
  M_SQRT2l = 1.414213562373095048801688724209698079;
  M_SQRT1_2l = 0.707106781186547524400844362104849039;


  // /usr/include/x86_64-linux-gnu/bits/mathcalls.h

function acos(x: double): double; cdecl; external libm;
function asin(x: double): double; cdecl; external libm;
function atan(x: double): double; cdecl; external libm;
function atan2(y, x: double): double; cdecl; external libm;
function cos(x: double): double; cdecl; external libm;
function sin(x: double): double; cdecl; external libm;
function tan(x: double): double; cdecl; external libm;
function cosh(x: double): double; cdecl; external libm;
function sinh(x: double): double; cdecl; external libm;
function tanh(x: double): double; cdecl; external libm;

function acosf(x: single): single; cdecl; external libm;
function asinf(x: single): single; cdecl; external libm;
function atanf(x: single): single; cdecl; external libm;
function atan2f(y, x: single): single; cdecl; external libm;
function cosf(x: single): single; cdecl; external libm;
function sinf(x: single): single; cdecl; external libm;
function tanf(x: single): single; cdecl; external libm;
function coshf(x: single): single; cdecl; external libm;
function sinhf(x: single): single; cdecl; external libm;
function tanhf(x: single): single; cdecl; external libm;

function acosl(x: Tlong_double): Tlong_double; cdecl; external libm;
function asinl(x: Tlong_double): Tlong_double; cdecl; external libm;
function atanl(x: Tlong_double): Tlong_double; cdecl; external libm;
function atan2l(y, x: Tlong_double): Tlong_double; cdecl; external libm;
function cosl(x: Tlong_double): Tlong_double; cdecl; external libm;
function sinl(x: Tlong_double): Tlong_double; cdecl; external libm;
function tanl(x: Tlong_double): Tlong_double; cdecl; external libm;
function coshl(x: Tlong_double): Tlong_double; cdecl; external libm;
function sinhl(x: Tlong_double): Tlong_double; cdecl; external libm;
function tanhl(x: Tlong_double): Tlong_double; cdecl; external libm;

// -------------------

procedure sincos(x: double; sinx, cosx: PDouble); cdecl; external libm;
procedure sincosf(x: single; sinx, cosx: PSingle); cdecl; external libm;
procedure sincosl(x: Tlong_double; sinx, cosx: Plong_double); cdecl; external libm;

// -------------------

function acosh(x: double): double; cdecl; external libm;
function asinh(x: double): double; cdecl; external libm;
function atanh(x: double): double; cdecl; external libm;

function acoshf(x: single): single; cdecl; external libm;
function asinhf(x: single): single; cdecl; external libm;
function atanhf(x: single): single; cdecl; external libm;

function acoshl(x: Tlong_double): Tlong_double; cdecl; external libm;
function asinhl(x: Tlong_double): Tlong_double; cdecl; external libm;
function atanhl(x: Tlong_double): Tlong_double; cdecl; external libm;

// -------------------

function exp(x: double): double; cdecl; external libm;
function frexp(x: double; exponent: PInteger): double; cdecl; external libm;
function ldexp(x: double; exponent: integer): double; cdecl; external libm;
function log(x: double): double; cdecl; external libm;
function log10(x: double): double; cdecl; external libm;
function modf(x: double; iptr: PDouble): double; cdecl; external libm;
function exp10(x: double): double; cdecl; external libm;
function expm1(x: double): double; cdecl; external libm;
function log1p(x: double): double; cdecl; external libm;
function logb(x: double): double; cdecl; external libm;
function exp2(x: double): double; cdecl; external libm;
function log2(x: double): double; cdecl; external libm;

function expf(x: single): single; cdecl; external libm;
function frexpf(x: single; exponent: PInteger): single; cdecl; external libm;
function ldexpf(x: single; exponent: integer): single; cdecl; external libm;
function logf(x: single): single; cdecl; external libm;
function log10f(x: single): single; cdecl; external libm;
function modff(x: single; iptr: Psingle): single; cdecl; external libm;
function exp10f(x: single): single; cdecl; external libm;
function expm1f(x: single): single; cdecl; external libm;
function log1pf(x: single): single; cdecl; external libm;
function logbf(x: single): single; cdecl; external libm;
function exp2f(x: single): single; cdecl; external libm;
function log2f(x: single): single; cdecl; external libm;

function expl(x: Tlong_double): Tlong_double; cdecl; external libm;
function frexpl(x: Tlong_double; exponent: PInteger): Tlong_double; cdecl; external libm;
function ldexpl(x: Tlong_double; exponent: integer): Tlong_double; cdecl; external libm;
function logl(x: Tlong_double): Tlong_double; cdecl; external libm;
function log10l(x: Tlong_double): Tlong_double; cdecl; external libm;
function modfl(x: Tlong_double; iptr: Plong_double): Tlong_double; cdecl; external libm;
function exp10l(x: Tlong_double): Tlong_double; cdecl; external libm;
function expm1l(x: Tlong_double): Tlong_double; cdecl; external libm;
function log1pl(x: Tlong_double): Tlong_double; cdecl; external libm;
function logbl(x: Tlong_double): Tlong_double; cdecl; external libm;
function exp2l(x: Tlong_double): Tlong_double; cdecl; external libm;
function log2l(x: Tlong_double): Tlong_double; cdecl; external libm;

// -------------------

function pow(x: double; y: double): double; cdecl; external libm;
function sqrt(x: double): double; cdecl; external libm;
function hypot(x: double; y: double): double; cdecl; external libm;
function cbrt(x: double): double; cdecl; external libm;

function powf(x: single; y: single): single; cdecl; external libm;
function sqrtf(x: single): single; cdecl; external libm;
function hypotf(x: single; y: single): single; cdecl; external libm;
function cbrtf(x: single): single; cdecl; external libm;

function powl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function sqrtl(x: Tlong_double): Tlong_double; cdecl; external libm;
function hypotl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function cbrtl(x: Tlong_double): Tlong_double; cdecl; external libm;

// -------------------

function ceil(x: double): double; cdecl; external libm;
function fabs(x: double): double; cdecl; external libm;
function floor(x: double): double; cdecl; external libm;
function fmod(x: double; y: double): double; cdecl; external libm;
function isinf(value: double): integer; cdecl; external libm;
function finite(value: double): integer; cdecl; external libm;
function drem(x: double; y: double): double; cdecl; external libm;
function significand(x: double): double; cdecl; external libm;

function ceilf(x: single): single; cdecl; external libm;
function fabsf(x: single): single; cdecl; external libm;
function floorf(x: single): single; cdecl; external libm;
function fmodf(x: single; y: single): single; cdecl; external libm;
function isinff(value: single): integer; cdecl; external libm;
function finitef(value: single): integer; cdecl; external libm;
function dremf(x: single; y: single): single; cdecl; external libm;
function significandf(x: single): single; cdecl; external libm;

function ceill(x: Tlong_double): Tlong_double; cdecl; external libm;
function fabsl(x: Tlong_double): Tlong_double; cdecl; external libm;
function floorl(x: Tlong_double): Tlong_double; cdecl; external libm;
function fmodl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function isinfl(value: Tlong_double): integer; cdecl; external libm;
function finitel(value: Tlong_double): integer; cdecl; external libm;
function dreml(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function significandl(x: Tlong_double): Tlong_double; cdecl; external libm;

// -------------------

function copysign(x: double; y: double): double; cdecl; external libm;
function nan(tagp: pansichar): double; cdecl; external libm;
function isnan(value: double): integer; cdecl; external libm;

function copysignf(x: single; y: single): single; cdecl; external libm;
function nanf(tagp: pansichar): single; cdecl; external libm;
function isnanf(value: single): integer; cdecl; external libm;

function copysignl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function nanl(tagp: pansichar): Tlong_double; cdecl; external libm;
function isnanl(value: Tlong_double): integer; cdecl; external libm;

function j0(x: double): double; cdecl; external libm;
function j1(x: double): double; cdecl; external libm;
function jn(n: integer; x: double): double; cdecl; external libm;
function y0(x: double): double; cdecl; external libm;
function y1(x: double): double; cdecl; external libm;
function yn(n: integer; x: double): double; cdecl; external libm;

function j0f(x: single): single; cdecl; external libm;
function j1f(x: single): single; cdecl; external libm;
function jnf(n: integer; x: single): single; cdecl; external libm;
function y0f(x: single): single; cdecl; external libm;
function y1f(x: single): single; cdecl; external libm;
function ynf(n: integer; x: single): single; cdecl; external libm;

function j0l(x: Tlong_double): Tlong_double; cdecl; external libm;
function j1l(x: Tlong_double): Tlong_double; cdecl; external libm;
function jnl(n: integer; x: Tlong_double): Tlong_double; cdecl; external libm;
function y0l(x: Tlong_double): Tlong_double; cdecl; external libm;
function y1l(x: Tlong_double): Tlong_double; cdecl; external libm;
function ynl(n: integer; x: Tlong_double): Tlong_double; cdecl; external libm;

function erf(x: double): double; cdecl; external libm;
function erfc(x: double): double; cdecl; external libm;
function lgamma(x: double): double; cdecl; external libm;
function tgamma(x: double): double; cdecl; external libm;
function gamma(x: double): double; cdecl; external libm;
function lgamma_r(x: double; signgamp: PInteger): double; cdecl; external libm;

function erff(x: single): single; cdecl; external libm;
function erfcf(x: single): single; cdecl; external libm;
function lgammaf(x: single): single; cdecl; external libm;
function tgammaf(x: single): single; cdecl; external libm;
function gammaf(x: single): single; cdecl; external libm;
function lgammaf_r(x: single; signgamp: PInteger): single; cdecl; external libm;

function erfl(x: Tlong_double): Tlong_double; cdecl; external libm;
function erfcl(x: Tlong_double): Tlong_double; cdecl; external libm;
function lgammal(x: Tlong_double): Tlong_double; cdecl; external libm;
function tgammal(x: Tlong_double): Tlong_double; cdecl; external libm;
function gammal(x: Tlong_double): Tlong_double; cdecl; external libm;
function lgamma_r_l(x: Tlong_double; signgamp: PInteger): Tlong_double; cdecl; external libm;

function rint(x: double): double; cdecl; external libm;
function nextafter(x: double; y: double): double; cdecl; external libm;
function nexttoward(x: double; y: Tlong_double): double; cdecl; external libm;
function nextdown(x: double): double; cdecl; external libm;
function nextup(x: double): double; cdecl; external libm;
function remainder(x: double; y: double): double; cdecl; external libm;
function scalbn(x: double; n: integer): double; cdecl; external libm;
function ilogb(x: double): integer; cdecl; external libm;
function llogb(x: double): int64; cdecl; external libm;
function scalbln(x: double; n: int64): double; cdecl; external libm;
function nearbyint(x: double): double; cdecl; external libm;
function round(x: double): double; cdecl; external libm;
function trunc(x: double): double; cdecl; external libm;
function remquo(x: double; y: double; quo: PInteger): double; cdecl; external libm;

function rintf(x: single): single; cdecl; external libm;
function nextafterf(x: single; y: single): single; cdecl; external libm;
function nextdownf(x: single): single; cdecl; external libm;
function nextupf(x: single): single; cdecl; external libm;
function remainderf(x: single; y: single): single; cdecl; external libm;
function scalbnf(x: single; n: integer): single; cdecl; external libm;
function ilogbf(x: single): integer; cdecl; external libm;
function llogbf(x: single): int64; cdecl; external libm;
function scalblnf(x: single; n: int64): single; cdecl; external libm;
function nearbyintf(x: single): single; cdecl; external libm;
function roundf(x: single): single; cdecl; external libm;
function truncf(x: single): single; cdecl; external libm;
function remquof(x: single; y: single; quo: PInteger): single; cdecl; external libm;

function rintl(x: Tlong_double): Tlong_double; cdecl; external libm;
function nextafterl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function nexttowardl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function nextdownl(x: Tlong_double): Tlong_double; cdecl; external libm;
function nextupl(x: Tlong_double): Tlong_double; cdecl; external libm;
function remainderl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function scalbnl(x: Tlong_double; n: integer): Tlong_double; cdecl; external libm;
function ilogbl(x: Tlong_double): integer; cdecl; external libm;
function llogbl(x: Tlong_double): int64; cdecl; external libm;
function scalblnl(x: Tlong_double; n: int64): Tlong_double; cdecl; external libm;
function nearbyintl(x: Tlong_double): Tlong_double; cdecl; external libm;
function roundl(x: Tlong_double): Tlong_double; cdecl; external libm;
function truncl(x: Tlong_double): Tlong_double; cdecl; external libm;
function remquol(x: Tlong_double; y: Tlong_double; quo: PInteger): Tlong_double; cdecl; external libm;

// -------------------

function lrint(x: double): int64; cdecl; external libm;
function llrint(x: double): int64; cdecl; external libm;
function lround(x: double): int64; cdecl; external libm;
function llround(x: double): int64; cdecl; external libm;
function fdim(x: double; y: double): double; cdecl; external libm;
function fmax(x: double; y: double): double; cdecl; external libm;
function fmin(x: double; y: double): double; cdecl; external libm;
function fma(x: double; y: double; z: double): double; cdecl; external libm;
function roundeven(x: double): double; cdecl; external libm;
function fromfp(x: double; round: integer; width: cardinal): int64; cdecl; external libm;
function ufromfp(x: double; round: integer; width: cardinal): uint64; cdecl; external libm;
function fromfpx(x: double; round: integer; width: cardinal): int64; cdecl; external libm;
function ufromfpx(x: double; round: integer; width: cardinal): uint64; cdecl; external libm;
function canonicalize(cx: PDouble; x: PDouble): integer; cdecl; external libm;
function fmaxmag(x: double; y: double): double; cdecl; external libm;
function fminmag(x: double; y: double): double; cdecl; external libm;
function fmaximum(x: double; y: double): double; cdecl; external libm;
function fminimum(x: double; y: double): double; cdecl; external libm;
function fmaximum_num(x: double; y: double): double; cdecl; external libm;
function fminimum_num(x: double; y: double): double; cdecl; external libm;
function fmaximum_mag(x: double; y: double): double; cdecl; external libm;
function fminimum_mag(x: double; y: double): double; cdecl; external libm;
function fmaximum_mag_num(x: double; y: double): double; cdecl; external libm;
function fminimum_mag_num(x: double; y: double): double; cdecl; external libm;
function totalorder(x, y: PDouble): integer; cdecl; external libm;
function totalordermag(x, y: PDouble): integer; cdecl; external libm;
function getpayload(x: PDouble): double; cdecl; external libm;
function setpayload(x: PDouble; payload: double): integer; cdecl; external libm;
function setpayloadsig(x: PDouble; payload: double): integer; cdecl; external libm;
function scalb(x: double; n: double): double; cdecl; external libm;

function lrintf(x: single): int64; cdecl; external libm;
function llrintf(x: single): int64; cdecl; external libm;
function lroundf(x: single): int64; cdecl; external libm;
function llroundf(x: single): int64; cdecl; external libm;
function fdimf(x: single; y: single): single; cdecl; external libm;
function fmaxf(x: single; y: single): single; cdecl; external libm;
function fminf(x: single; y: single): single; cdecl; external libm;
function fmaf(x: single; y: single; z: single): single; cdecl; external libm;
function roundevenf(x: single): single; cdecl; external libm;
function fromfpf(x: single; round: integer; width: cardinal): int64; cdecl; external libm;
function ufromfpf(x: single; round: integer; width: cardinal): uint64; cdecl; external libm;
function fromfpxf(x: single; round: integer; width: cardinal): int64; cdecl; external libm;
function ufromfpxf(x: single; round: integer; width: cardinal): uint64; cdecl; external libm;
function canonicalizef(cx: PSingle; x: PSingle): integer; cdecl; external libm;
function fmaxmagf(x: single; y: single): single; cdecl; external libm;
function fminmagf(x: single; y: single): single; cdecl; external libm;
function fmaximumf(x: single; y: single): single; cdecl; external libm;
function fminimumf(x: single; y: single): single; cdecl; external libm;
function fmaximum_numf(x: single; y: single): single; cdecl; external libm;
function fminimum_numf(x: single; y: single): single; cdecl; external libm;
function fmaximum_magf(x: single; y: single): single; cdecl; external libm;
function fminimum_magf(x: single; y: single): single; cdecl; external libm;
function fmaximum_mag_numf(x: single; y: single): single; cdecl; external libm;
function fminimum_mag_numf(x: single; y: single): single; cdecl; external libm;
function totalorderf(x, y: PSingle): integer; cdecl; external libm;
function totalordermagf(x, y: PSingle): integer; cdecl; external libm;
function getpayloadf(x: PSingle): single; cdecl; external libm;
function setpayloadf(x: PSingle; payload: single): integer; cdecl; external libm;
function setpayloadsigf(x: PSingle; payload: single): integer; cdecl; external libm;
function scalbf(x: single; n: single): single; cdecl; external libm;

function lrintl(x: Tlong_double): int64; cdecl; external libm;
function llrintl(x: Tlong_double): int64; cdecl; external libm;
function lroundl(x: Tlong_double): int64; cdecl; external libm;
function llroundl(x: Tlong_double): int64; cdecl; external libm;
function fdiml(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fmaxl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fminl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fmal(x: Tlong_double; y: Tlong_double; z: Tlong_double): Tlong_double; cdecl; external libm;
function roundevenl(x: Tlong_double): Tlong_double; cdecl; external libm;
function fromfpl(x: Tlong_double; round: integer; width: cardinal): int64; cdecl; external libm;
function ufromfpl(x: Tlong_double; round: integer; width: cardinal): uint64; cdecl; external libm;
function fromfpxl(x: Tlong_double; round: integer; width: cardinal): int64; cdecl; external libm;
function ufromfpxl(x: Tlong_double; round: integer; width: cardinal): uint64; cdecl; external libm;
function canonicalizel(cx: Plong_double; x: Plong_double): integer; cdecl; external libm;
function fmaxmagl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fminmagl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fmaximuml(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fminimuml(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fmaximum_numl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fminimum_numl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fmaximum_magl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fminimum_magl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fmaximum_mag_numl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function fminimum_mag_numl(x: Tlong_double; y: Tlong_double): Tlong_double; cdecl; external libm;
function totalorderl(x, y: Plong_double): integer; cdecl; external libm;
function totalordermagl(x, y: Plong_double): integer; cdecl; external libm;
function getpayloadl(x: Plong_double): Tlong_double; cdecl; external libm;
function setpayloadl(x: Plong_double; payload: Tlong_double): integer; cdecl; external libm;
function setpayloadsigl(x: Plong_double; payload: Tlong_double): integer; cdecl; external libm;
function scalbl(x: Tlong_double; n: Tlong_double): Tlong_double; cdecl; external libm;


// === Konventiert am: 6-8-25 19:41:07 ===


implementation


end.
