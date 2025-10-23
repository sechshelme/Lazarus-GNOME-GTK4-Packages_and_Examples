{$IFDEF read_interface}


const
  GSL_IEEE_TYPE_NAN = 1;
  GSL_IEEE_TYPE_INF = 2;
  GSL_IEEE_TYPE_NORMAL = 3;
  GSL_IEEE_TYPE_DENORMAL = 4;
  GSL_IEEE_TYPE_ZERO = 5;

type
  Tgsl_ieee_float_rep = record
    sign: longint;
    mantissa: array[0..23] of char;
    exponent: longint;
    _type: longint;
  end;
  Pgsl_ieee_float_rep = ^Tgsl_ieee_float_rep;

  Tgsl_ieee_double_rep = record
    sign: longint;
    mantissa: array[0..52] of char;
    exponent: longint;
    _type: longint;
  end;
  Pgsl_ieee_double_rep = ^Tgsl_ieee_double_rep;

procedure gsl_ieee_printf_float(x: Psingle); cdecl; external libgsl;
procedure gsl_ieee_printf_double(x: Pdouble); cdecl; external libgsl;
procedure gsl_ieee_fprintf_float(stream: PFILE; x: Psingle); cdecl; external libgsl;
procedure gsl_ieee_fprintf_double(stream: PFILE; x: Pdouble); cdecl; external libgsl;
procedure gsl_ieee_float_to_rep(x: Psingle; r: Pgsl_ieee_float_rep); cdecl; external libgsl;
procedure gsl_ieee_double_to_rep(x: Pdouble; r: Pgsl_ieee_double_rep); cdecl; external libgsl;

const
  GSL_IEEE_SINGLE_PRECISION = 1;
  GSL_IEEE_DOUBLE_PRECISION = 2;
  GSL_IEEE_EXTENDED_PRECISION = 3;

const
  GSL_IEEE_ROUND_TO_NEAREST = 1;
  GSL_IEEE_ROUND_DOWN = 2;
  GSL_IEEE_ROUND_UP = 3;
  GSL_IEEE_ROUND_TO_ZERO = 4;

const
  GSL_IEEE_MASK_INVALID = 1;
  GSL_IEEE_MASK_DENORMALIZED = 2;
  GSL_IEEE_MASK_DIVISION_BY_ZERO = 4;
  GSL_IEEE_MASK_OVERFLOW = 8;
  GSL_IEEE_MASK_UNDERFLOW = 16;
  GSL_IEEE_MASK_ALL = 31;
  GSL_IEEE_TRAP_INEXACT = 32;


procedure gsl_ieee_env_setup; cdecl; external libgsl;
function gsl_ieee_read_mode_string(description: pchar; precision: Plongint; rounding: Plongint; exception_mask: Plongint): longint; cdecl; external libgsl;
function gsl_ieee_set_mode(precision: longint; rounding: longint; exception_mask: longint): longint; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:09:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
