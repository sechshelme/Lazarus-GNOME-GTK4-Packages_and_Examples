

  {$IFDEF read_enum}
type
  PVipsOperationMath = ^TVipsOperationMath;
  TVipsOperationMath = longint;

const
  VIPS_OPERATION_MATH_SIN = 0;
  VIPS_OPERATION_MATH_COS = 1;
  VIPS_OPERATION_MATH_TAN = 2;
  VIPS_OPERATION_MATH_ASIN = 3;
  VIPS_OPERATION_MATH_ACOS = 4;
  VIPS_OPERATION_MATH_ATAN = 5;
  VIPS_OPERATION_MATH_LOG = 6;
  VIPS_OPERATION_MATH_LOG10 = 7;
  VIPS_OPERATION_MATH_EXP = 8;
  VIPS_OPERATION_MATH_EXP10 = 9;
  VIPS_OPERATION_MATH_SINH = 10;
  VIPS_OPERATION_MATH_COSH = 11;
  VIPS_OPERATION_MATH_TANH = 12;
  VIPS_OPERATION_MATH_ASINH = 13;
  VIPS_OPERATION_MATH_ACOSH = 14;
  VIPS_OPERATION_MATH_ATANH = 15;
  VIPS_OPERATION_MATH_LAST = 16;

type
  PVipsOperationMath2 = ^TVipsOperationMath2;
  TVipsOperationMath2 = longint;

const
  VIPS_OPERATION_MATH2_POW = 0;
  VIPS_OPERATION_MATH2_WOP = 1;
  VIPS_OPERATION_MATH2_ATAN2 = 2;
  VIPS_OPERATION_MATH2_LAST = 3;

type
  PVipsOperationRound = ^TVipsOperationRound;
  TVipsOperationRound = longint;

const
  VIPS_OPERATION_ROUND_RINT = 0;
  VIPS_OPERATION_ROUND_CEIL = 1;
  VIPS_OPERATION_ROUND_FLOOR = 2;
  VIPS_OPERATION_ROUND_LAST = 3;

type
  PVipsOperationRelational = ^TVipsOperationRelational;
  TVipsOperationRelational = longint;

const
  VIPS_OPERATION_RELATIONAL_EQUAL = 0;
  VIPS_OPERATION_RELATIONAL_NOTEQ = 1;
  VIPS_OPERATION_RELATIONAL_LESS = 2;
  VIPS_OPERATION_RELATIONAL_LESSEQ = 3;
  VIPS_OPERATION_RELATIONAL_MORE = 4;
  VIPS_OPERATION_RELATIONAL_MOREEQ = 5;
  VIPS_OPERATION_RELATIONAL_LAST = 6;

type
  PVipsOperationBoolean = ^TVipsOperationBoolean;
  TVipsOperationBoolean = longint;

const
  VIPS_OPERATION_BOOLEAN_AND = 0;
  VIPS_OPERATION_BOOLEAN_OR = 1;
  VIPS_OPERATION_BOOLEAN_EOR = 2;
  VIPS_OPERATION_BOOLEAN_LSHIFT = 3;
  VIPS_OPERATION_BOOLEAN_RSHIFT = 4;
  VIPS_OPERATION_BOOLEAN_LAST = 5;

type
  PVipsOperationComplex = ^TVipsOperationComplex;
  TVipsOperationComplex = longint;

const
  VIPS_OPERATION_COMPLEX_POLAR = 0;
  VIPS_OPERATION_COMPLEX_RECT = 1;
  VIPS_OPERATION_COMPLEX_CONJ = 2;
  VIPS_OPERATION_COMPLEX_LAST = 3;

type
  PVipsOperationComplex2 = ^TVipsOperationComplex2;
  TVipsOperationComplex2 = longint;

const
  VIPS_OPERATION_COMPLEX2_CROSS_PHASE = 0;
  VIPS_OPERATION_COMPLEX2_LAST = 1;

type
  PVipsOperationComplexget = ^TVipsOperationComplexget;
  TVipsOperationComplexget = longint;

const
  VIPS_OPERATION_COMPLEXGET_REAL = 0;
  VIPS_OPERATION_COMPLEXGET_IMAG = 1;
  VIPS_OPERATION_COMPLEXGET_LAST = 2;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_add(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_sum(in_: PPVipsImage; out_: PPVipsImage; n: longint): longint; varargs; cdecl; external libvips;
function vips_subtract(in1: PVipsImage; in2: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_multiply(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_divide(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_linear(in_: PVipsImage; out_: PPVipsImage; a: Pdouble; b: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_linear1(in_: PVipsImage; out_: PPVipsImage; a: double; b: double): longint; varargs; cdecl; external libvips;
function vips_remainder(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_remainder_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_remainder_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_invert(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_abs(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_sign(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_round(in_: PVipsImage; out_: PPVipsImage; round: TVipsOperationRound): longint; varargs; cdecl; external libvips;
function vips_floor(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_ceil(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rint(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_math(in_: PVipsImage; out_: PPVipsImage; math: TVipsOperationMath): longint; varargs; cdecl; external libvips;
function vips_sin(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cos(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_tan(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_asin(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_acos(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_atan(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_exp(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_exp10(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_log(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_log10(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_sinh(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_cosh(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_tanh(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_asinh(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_acosh(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_atanh(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_complex(in_: PVipsImage; out_: PPVipsImage; cmplx: TVipsOperationComplex): longint; varargs; cdecl; external libvips;
function vips_polar(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rect(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_conj(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_complex2(left: PVipsImage; right: PVipsImage; out_: PPVipsImage; cmplx: TVipsOperationComplex2): longint; varargs; cdecl; external libvips;
function vips_cross_phase(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_complexget(in_: PVipsImage; out_: PPVipsImage; get: TVipsOperationComplexget): longint; varargs; cdecl; external libvips;
function vips_real(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_imag(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_complexform(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_relational(left: PVipsImage; right: PVipsImage; out_: PPVipsImage; relational: TVipsOperationRelational): longint; varargs; cdecl; external libvips;
function vips_equal(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_notequal(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_less(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_lesseq(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_more(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_moreeq(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_relational_const(in_: PVipsImage; out_: PPVipsImage; relational: TVipsOperationRelational; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_equal_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_notequal_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_less_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_lesseq_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_more_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_moreeq_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_relational_const1(in_: PVipsImage; out_: PPVipsImage; relational: TVipsOperationRelational; c: double): longint; varargs; cdecl; external libvips;
function vips_equal_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_notequal_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_less_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_lesseq_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_more_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_moreeq_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_boolean(left: PVipsImage; right: PVipsImage; out_: PPVipsImage; boolean: TVipsOperationBoolean): longint; varargs; cdecl; external libvips;
function vips_andimage(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_orimage(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_eorimage(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_lshift(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_rshift(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_boolean_const(in_: PVipsImage; out_: PPVipsImage; boolean: TVipsOperationBoolean; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_andimage_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_orimage_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_eorimage_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_lshift_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_rshift_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_boolean_const1(in_: PVipsImage; out_: PPVipsImage; boolean: TVipsOperationBoolean; c: double): longint; varargs; cdecl; external libvips;
function vips_andimage_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_orimage_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_eorimage_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_lshift_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_rshift_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_math2(left: PVipsImage; right: PVipsImage; out_: PPVipsImage; math2: TVipsOperationMath2): longint; varargs; cdecl; external libvips;
function vips_pow(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_wop(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_atan2(left: PVipsImage; right: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_math2_const(in_: PVipsImage; out_: PPVipsImage; math2: TVipsOperationMath2; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_pow_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_wop_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_atan2_const(in_: PVipsImage; out_: PPVipsImage; c: Pdouble; n: longint): longint; varargs; cdecl; external libvips;
function vips_math2_const1(in_: PVipsImage; out_: PPVipsImage; math2: TVipsOperationMath2; c: double): longint; varargs; cdecl; external libvips;
function vips_pow_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_wop_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_atan2_const1(in_: PVipsImage; out_: PPVipsImage; c: double): longint; varargs; cdecl; external libvips;
function vips_avg(in_: PVipsImage; out_: Pdouble): longint; varargs; cdecl; external libvips;
function vips_deviate(in_: PVipsImage; out_: Pdouble): longint; varargs; cdecl; external libvips;
function vips_min(in_: PVipsImage; out_: Pdouble): longint; varargs; cdecl; external libvips;
function vips_max(in_: PVipsImage; out_: Pdouble): longint; varargs; cdecl; external libvips;
function vips_stats(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_measure(in_: PVipsImage; out_: PPVipsImage; h: longint; v: longint): longint; varargs; cdecl; external libvips;
function vips_find_trim(in_: PVipsImage; left: Plongint; top: Plongint; width: Plongint; height: Plongint): longint; varargs; cdecl; external libvips;
function vips_getpoint(in_: PVipsImage; vector: PPdouble; n: Plongint; x: longint; y: longint): longint; varargs; cdecl; external libvips;
function vips_hist_find(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hist_find_ndim(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hist_find_indexed(in_: PVipsImage; index: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hough_line(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hough_circle(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_project(in_: PVipsImage; columns: PPVipsImage; rows: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_profile(in_: PVipsImage; columns: PPVipsImage; rows: PPVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:15:33 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
