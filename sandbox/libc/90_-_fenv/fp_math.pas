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

  //function sin(d: Double): Double; cdecl; external libm;

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

function acosl(x: TLongDouble): TLongDouble; cdecl; external libm;
function asinl(x: TLongDouble): TLongDouble; cdecl; external libm;
function atanl(x: TLongDouble): TLongDouble; cdecl; external libm;
function atan2l(y, x: TLongDouble): TLongDouble; cdecl; external libm;
function cosl(x: TLongDouble): TLongDouble; cdecl; external libm;
function sinl(x: TLongDouble): TLongDouble; cdecl; external libm;
function tanl(x: TLongDouble): TLongDouble; cdecl; external libm;
function coshl(x: TLongDouble): TLongDouble; cdecl; external libm;
function sinhl(x: TLongDouble): TLongDouble; cdecl; external libm;
function tanhl(x: TLongDouble): TLongDouble; cdecl; external libm;




// /usr/include/x86_64-linux-gnu/bits/cmathcalls.h



// === Konventiert am: 6-8-25 19:41:07 ===


implementation


end.
