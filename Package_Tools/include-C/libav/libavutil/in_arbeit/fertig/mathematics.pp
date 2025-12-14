
unit mathematics;
interface

{
  Automatically converted by H2Pas 1.0.0 from mathematics.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mathematics.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAVRounding  = ^AVRounding;
Pint64_t  = ^int64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * copyright (c) 2005-2012 Michael Niedermayer <michaelni@gmx.at>
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{*
 * @file
 * @addtogroup lavu_math
 * Mathematical utilities for working with timestamp and time base.
  }
{$ifndef AVUTIL_MATHEMATICS_H}
{$define AVUTIL_MATHEMATICS_H}
{$include <stdint.h>}
{$include <math.h>}
{$include "attributes.h"}
{$include "rational.h"}
{$include "intfloat.h"}
{$ifndef M_E}
{ e  }

const
  M_E = 2.7182818284590452354;  
{$endif}
{$ifndef M_Ef}
{ e  }

const
  M_Ef = 2.7182818284590452354;  
{$endif}
{$ifndef M_LN2}
{ log_e 2  }

const
  M_LN2 = 0.69314718055994530942;  
{$endif}
{$ifndef M_LN2f}
{ log_e 2  }

const
  M_LN2f = 0.69314718055994530942;  
{$endif}
{$ifndef M_LN10}
{ log_e 10  }

const
  M_LN10 = 2.30258509299404568402;  
{$endif}
{$ifndef M_LN10f}
{ log_e 10  }

const
  M_LN10f = 2.30258509299404568402;  
{$endif}
{$ifndef M_LOG2_10}
{ log_2 10  }

const
  M_LOG2_10 = 3.32192809488736234787;  
{$endif}
{$ifndef M_LOG2_10f}
{ log_2 10  }

const
  M_LOG2_10f = 3.32192809488736234787;  
{$endif}
{$ifndef M_PHI}
{ phi / golden ratio  }

const
  M_PHI = 1.61803398874989484820;  
{$endif}
{$ifndef M_PHIf}
{ phi / golden ratio  }

const
  M_PHIf = 1.61803398874989484820;  
{$endif}
{$ifndef M_PI}
{ pi  }

const
  M_PI = 3.14159265358979323846;  
{$endif}
{$ifndef M_PIf}
{ pi  }

const
  M_PIf = 3.14159265358979323846;  
{$endif}
{$ifndef M_PI_2}
{ pi/2  }

const
  M_PI_2 = 1.57079632679489661923;  
{$endif}
{$ifndef M_PI_2f}
{ pi/2  }

const
  M_PI_2f = 1.57079632679489661923;  
{$endif}
{$ifndef M_PI_4}
{ pi/4  }

const
  M_PI_4 = 0.78539816339744830962;  
{$endif}
{$ifndef M_PI_4f}
{ pi/4  }

const
  M_PI_4f = 0.78539816339744830962;  
{$endif}
{$ifndef M_1_PI}
{ 1/pi  }

const
  M_1_PI = 0.31830988618379067154;  
{$endif}
{$ifndef M_1_PIf}
{ 1/pi  }

const
  M_1_PIf = 0.31830988618379067154;  
{$endif}
{$ifndef M_2_PI}
{ 2/pi  }

const
  M_2_PI = 0.63661977236758134308;  
{$endif}
{$ifndef M_2_PIf}
{ 2/pi  }

const
  M_2_PIf = 0.63661977236758134308;  
{$endif}
{$ifndef M_2_SQRTPI}
{ 2/sqrt(pi)  }

const
  M_2_SQRTPI = 1.12837916709551257390;  
{$endif}
{$ifndef M_2_SQRTPIf}
{ 2/sqrt(pi)  }

const
  M_2_SQRTPIf = 1.12837916709551257390;  
{$endif}
{$ifndef M_SQRT1_2}
{ 1/sqrt(2)  }

const
  M_SQRT1_2 = 0.70710678118654752440;  
{$endif}
{$ifndef M_SQRT1_2f}
{ 1/sqrt(2)  }

const
  M_SQRT1_2f = 0.70710678118654752440;  
{$endif}
{$ifndef M_SQRT2}
{ sqrt(2)  }

const
  M_SQRT2 = 1.41421356237309504880;  
{$endif}
{$ifndef M_SQRT2f}
{ sqrt(2)  }

const
  M_SQRT2f = 1.41421356237309504880;  
{$endif}
{$ifndef NAN}

{ was #define dname def_expr }
function NAN : longint; { return type might be wrong }

{$endif}
{$ifndef INFINITY}

{ was #define dname def_expr }
function INFINITY : longint; { return type might be wrong }

{$endif}
{*
 * @addtogroup lavu_math
 *
 * @
  }
{*
 * Rounding methods.
  }
{/< Round toward zero. }
{/< Round away from zero. }
{/< Round toward -infinity. }
{/< Round toward +infinity. }
{/< Round to nearest and halfway cases away from zero. }
{*
     * Flag telling rescaling functions to pass `INT64_MIN`/`MAX` through
     * unchanged, avoiding special cases for #AV_NOPTS_VALUE.
     *
     * Unlike other values of the enumeration AVRounding, this value is a
     * bitmask that must be used in conjunction with another value of the
     * enumeration through a bitwise OR, in order to set behavior for normal
     * cases.
     *
     * @code.c
     * av_rescale_rnd(3, 1, 2, AV_ROUND_UP | AV_ROUND_PASS_MINMAX);
     * // Rescaling 3:
     * //     Calculating 3 * 1 / 2
     * //     3 / 2 is rounded up to 2
     * //     => 2
     *
     * av_rescale_rnd(AV_NOPTS_VALUE, 1, 2, AV_ROUND_UP | AV_ROUND_PASS_MINMAX);
     * // Rescaling AV_NOPTS_VALUE:
     * //     AV_NOPTS_VALUE == INT64_MIN
     * //     AV_NOPTS_VALUE is passed through
     * //     => AV_NOPTS_VALUE
     * @endcode
      }
type
  TAVRounding =  Longint;
  Const
    AV_ROUND_ZERO = 0;
    AV_ROUND_INF = 1;
    AV_ROUND_DOWN = 2;
    AV_ROUND_UP = 3;
    AV_ROUND_NEAR_INF = 5;
    AV_ROUND_PASS_MINMAX = 8192;

{*
 * Compute the greatest common divisor of two integer operands.
 *
 * @param a Operand
 * @param b Operand
 * @return GCD of a and b up to sign; if a >= 0 and b >= 0, return value is >= 0;
 * if a == 0 and b == 0, returns 0.
  }

function av_gcd(a:Tint64_t; b:Tint64_t):Tint64_t;cdecl;external;
{*
 * Rescale a 64-bit integer with rounding to nearest.
 *
 * The operation is mathematically equivalent to `a * b / c`, but writing that
 * directly can overflow.
 *
 * This function is equivalent to av_rescale_rnd() with #AV_ROUND_NEAR_INF.
 *
 * @see av_rescale_rnd(), av_rescale_q(), av_rescale_q_rnd()
  }
function av_rescale(a:Tint64_t; b:Tint64_t; c:Tint64_t):Tint64_t;cdecl;external;
{*
 * Rescale a 64-bit integer with specified rounding.
 *
 * The operation is mathematically equivalent to `a * b / c`, but writing that
 * directly can overflow, and does not support different rounding methods.
 * If the result is not representable then INT64_MIN is returned.
 *
 * @see av_rescale(), av_rescale_q(), av_rescale_q_rnd()
  }
function av_rescale_rnd(a:Tint64_t; b:Tint64_t; c:Tint64_t; rnd:TAVRounding):Tint64_t;cdecl;external;
{*
 * Rescale a 64-bit integer by 2 rational numbers.
 *
 * The operation is mathematically equivalent to `a * bq / cq`.
 *
 * This function is equivalent to av_rescale_q_rnd() with #AV_ROUND_NEAR_INF.
 *
 * @see av_rescale(), av_rescale_rnd(), av_rescale_q_rnd()
  }
function av_rescale_q(a:Tint64_t; bq:TAVRational; cq:TAVRational):Tint64_t;cdecl;external;
{*
 * Rescale a 64-bit integer by 2 rational numbers with specified rounding.
 *
 * The operation is mathematically equivalent to `a * bq / cq`.
 *
 * @see av_rescale(), av_rescale_rnd(), av_rescale_q()
  }
function av_rescale_q_rnd(a:Tint64_t; bq:TAVRational; cq:TAVRational; rnd:TAVRounding):Tint64_t;cdecl;external;
{*
 * Compare two timestamps each in its own time base.
 *
 * @return One of the following values:
 *         - -1 if `ts_a` is before `ts_b`
 *         - 1 if `ts_a` is after `ts_b`
 *         - 0 if they represent the same position
 *
 * @warning
 * The result of the function is undefined if one of the timestamps is outside
 * the `int64_t` range when represented in the other's timebase.
  }
function av_compare_ts(ts_a:Tint64_t; tb_a:TAVRational; ts_b:Tint64_t; tb_b:TAVRational):longint;cdecl;external;
{*
 * Compare the remainders of two integer operands divided by a common divisor.
 *
 * In other words, compare the least significant `log2(mod)` bits of integers
 * `a` and `b`.
 *
 * @code.c
 * av_compare_mod(0x11, 0x02, 0x10) < 0 // since 0x11 % 0x10  (0x1) < 0x02 % 0x10  (0x2)
 * av_compare_mod(0x11, 0x02, 0x20) > 0 // since 0x11 % 0x20 (0x11) > 0x02 % 0x20 (0x02)
 * @endcode
 *
 * @param a Operand
 * @param b Operand
 * @param mod Divisor; must be a power of 2
 * @return
 *         - a negative value if `a % mod < b % mod`
 *         - a positive value if `a % mod > b % mod`
 *         - zero             if `a % mod == b % mod`
  }
function av_compare_mod(a:Tuint64_t; b:Tuint64_t; mod:Tuint64_t):Tint64_t;cdecl;external;
{*
 * Rescale a timestamp while preserving known durations.
 *
 * This function is designed to be called per audio packet to scale the input
 * timestamp to a different time base. Compared to a simple av_rescale_q()
 * call, this function is robust against possible inconsistent frame durations.
 *
 * The `last` parameter is a state variable that must be preserved for all
 * subsequent calls for the same stream. For the first call, `*last` should be
 * initialized to #AV_NOPTS_VALUE.
 *
 * @param[in]     in_tb    Input time base
 * @param[in]     in_ts    Input timestamp
 * @param[in]     fs_tb    Duration time base; typically this is finer-grained
 *                         (greater) than `in_tb` and `out_tb`
 * @param[in]     duration Duration till the next call to this function (i.e.
 *                         duration of the current packet/frame)
 * @param[in,out] last     Pointer to a timestamp expressed in terms of
 *                         `fs_tb`, acting as a state variable
 * @param[in]     out_tb   Output timebase
 * @return        Timestamp expressed in terms of `out_tb`
 *
 * @note In the context of this function, "duration" is in term of samples, not
 *       seconds.
  }
function av_rescale_delta(in_tb:TAVRational; in_ts:Tint64_t; fs_tb:TAVRational; duration:longint; last:Pint64_t; 
           out_tb:TAVRational):Tint64_t;cdecl;external;
{*
 * Add a value to a timestamp.
 *
 * This function guarantees that when the same value is repeatly added that
 * no accumulation of rounding errors occurs.
 *
 * @param[in] ts     Input timestamp
 * @param[in] ts_tb  Input timestamp time base
 * @param[in] inc    Value to be added
 * @param[in] inc_tb Time base of `inc`
  }
function av_add_stable(ts_tb:TAVRational; ts:Tint64_t; inc_tb:TAVRational; inc:Tint64_t):Tint64_t;cdecl;external;
{*
 * 0th order modified bessel function of the first kind.
  }
function av_bessel_i0(x:Tdouble):Tdouble;cdecl;external;
{*
 * @
  }

implementation

{ was #define dname def_expr }
function NAN : longint; { return type might be wrong }
  begin
    NAN:=av_int2float($7fc00000);
  end;

{ was #define dname def_expr }
function INFINITY : longint; { return type might be wrong }
  begin
    INFINITY:=av_int2float($7f800000);
  end;


end.
