
unit arithmetic;
interface

{
  Automatically converted by H2Pas 1.0.0 from arithmetic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    arithmetic.h
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
Pdouble  = ^double;
Plongint  = ^longint;
PVipsImage  = ^VipsImage;
PVipsOperationBoolean  = ^VipsOperationBoolean;
PVipsOperationComplex  = ^VipsOperationComplex;
PVipsOperationComplex2  = ^VipsOperationComplex2;
PVipsOperationComplexget  = ^VipsOperationComplexget;
PVipsOperationMath  = ^VipsOperationMath;
PVipsOperationMath2  = ^VipsOperationMath2;
PVipsOperationRelational  = ^VipsOperationRelational;
PVipsOperationRound  = ^VipsOperationRound;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Headers for arithmetic
 *
 * 30/6/09
 * 	- from proto.h
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_ARITHMETIC_H}
{$define VIPS_ARITHMETIC_H}
{$include <glib.h>}
{$include <vips/image.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{*
 * VipsOperationMath:
 * @VIPS_OPERATION_MATH_SIN: sin(), angles in degrees
 * @VIPS_OPERATION_MATH_COS: cos(), angles in degrees
 * @VIPS_OPERATION_MATH_TAN: tan(), angles in degrees
 * @VIPS_OPERATION_MATH_ASIN: asin(), angles in degrees
 * @VIPS_OPERATION_MATH_ACOS: acos(), angles in degrees
 * @VIPS_OPERATION_MATH_ATAN: atan(), angles in degrees
 * @VIPS_OPERATION_MATH_LOG: log base e
 * @VIPS_OPERATION_MATH_LOG10: log base 10
 * @VIPS_OPERATION_MATH_EXP: e to the something
 * @VIPS_OPERATION_MATH_EXP10: 10 to the something
 * @VIPS_OPERATION_MATH_SINH: sinh(), angles in radians
 * @VIPS_OPERATION_MATH_COSH: cosh(), angles in radians
 * @VIPS_OPERATION_MATH_TANH: tanh(), angles in radians
 * @VIPS_OPERATION_MATH_ASINH: asinh(), angles in radians
 * @VIPS_OPERATION_MATH_ACOSH: acosh(), angles in radians
 * @VIPS_OPERATION_MATH_ATANH: atanh(), angles in radians
 *
 * See also: vips_math().
  }
type
  PVipsOperationMath = ^TVipsOperationMath;
  TVipsOperationMath =  Longint;
  Const
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
;
{*
 * VipsOperationMath2:
 * @VIPS_OPERATION_MATH2_POW: pow(left, right)
 * @VIPS_OPERATION_MATH2_WOP: pow(right, left)
 * @VIPS_OPERATION_MATH2_ATAN2: atan2(left, right)
 *
 * See also: vips_math().
  }
type
  PVipsOperationMath2 = ^TVipsOperationMath2;
  TVipsOperationMath2 =  Longint;
  Const
    VIPS_OPERATION_MATH2_POW = 0;
    VIPS_OPERATION_MATH2_WOP = 1;
    VIPS_OPERATION_MATH2_ATAN2 = 2;
    VIPS_OPERATION_MATH2_LAST = 3;
;
{*
 * VipsOperationRound:
 * @VIPS_OPERATION_ROUND_RINT: round to nearest
 * @VIPS_OPERATION_ROUND_FLOOR: largest integral value not greater than
 * @VIPS_OPERATION_ROUND_CEIL: the smallest integral value not less than
 *
 * See also: vips_round().
  }
type
  PVipsOperationRound = ^TVipsOperationRound;
  TVipsOperationRound =  Longint;
  Const
    VIPS_OPERATION_ROUND_RINT = 0;
    VIPS_OPERATION_ROUND_CEIL = 1;
    VIPS_OPERATION_ROUND_FLOOR = 2;
    VIPS_OPERATION_ROUND_LAST = 3;
;
{*
 * VipsOperationRelational:
 * @VIPS_OPERATION_RELATIONAL_EQUAL: ==
 * @VIPS_OPERATION_RELATIONAL_NOTEQ: !=
 * @VIPS_OPERATION_RELATIONAL_LESS: <
 * @VIPS_OPERATION_RELATIONAL_LESSEQ: <=
 * @VIPS_OPERATION_RELATIONAL_MORE: >
 * @VIPS_OPERATION_RELATIONAL_MOREEQ: >=
 *
 * See also: vips_relational().
  }
type
  PVipsOperationRelational = ^TVipsOperationRelational;
  TVipsOperationRelational =  Longint;
  Const
    VIPS_OPERATION_RELATIONAL_EQUAL = 0;
    VIPS_OPERATION_RELATIONAL_NOTEQ = 1;
    VIPS_OPERATION_RELATIONAL_LESS = 2;
    VIPS_OPERATION_RELATIONAL_LESSEQ = 3;
    VIPS_OPERATION_RELATIONAL_MORE = 4;
    VIPS_OPERATION_RELATIONAL_MOREEQ = 5;
    VIPS_OPERATION_RELATIONAL_LAST = 6;
;
{*
 * VipsOperationBoolean:
 * @VIPS_OPERATION_BOOLEAN_AND: &
 * @VIPS_OPERATION_BOOLEAN_OR: |
 * @VIPS_OPERATION_BOOLEAN_EOR: ^
 * @VIPS_OPERATION_BOOLEAN_LSHIFT: >>
 * @VIPS_OPERATION_BOOLEAN_RSHIFT: <<
 *
 * See also: vips_boolean().
  }
type
  PVipsOperationBoolean = ^TVipsOperationBoolean;
  TVipsOperationBoolean =  Longint;
  Const
    VIPS_OPERATION_BOOLEAN_AND = 0;
    VIPS_OPERATION_BOOLEAN_OR = 1;
    VIPS_OPERATION_BOOLEAN_EOR = 2;
    VIPS_OPERATION_BOOLEAN_LSHIFT = 3;
    VIPS_OPERATION_BOOLEAN_RSHIFT = 4;
    VIPS_OPERATION_BOOLEAN_LAST = 5;
;
{*
 * VipsOperationComplex:
 * @VIPS_OPERATION_COMPLEX_POLAR: convert to polar coordinates
 * @VIPS_OPERATION_COMPLEX_RECT: convert to rectangular coordinates
 * @VIPS_OPERATION_COMPLEX_CONJ: complex conjugate
 *
 * See also: vips_complex().
  }
type
  PVipsOperationComplex = ^TVipsOperationComplex;
  TVipsOperationComplex =  Longint;
  Const
    VIPS_OPERATION_COMPLEX_POLAR = 0;
    VIPS_OPERATION_COMPLEX_RECT = 1;
    VIPS_OPERATION_COMPLEX_CONJ = 2;
    VIPS_OPERATION_COMPLEX_LAST = 3;
;
{*
 * VipsOperationComplex2:
 * @VIPS_OPERATION_COMPLEX2_CROSS_PHASE: convert to polar coordinates
 *
 * See also: vips_complex2().
  }
type
  PVipsOperationComplex2 = ^TVipsOperationComplex2;
  TVipsOperationComplex2 =  Longint;
  Const
    VIPS_OPERATION_COMPLEX2_CROSS_PHASE = 0;
    VIPS_OPERATION_COMPLEX2_LAST = 1;
;
{*
 * VipsOperationComplexget:
 * @VIPS_OPERATION_COMPLEXGET_REAL: get real component
 * @VIPS_OPERATION_COMPLEXGET_IMAG: get imaginary component
 *
 * See also: vips_complexget().
  }
type
  PVipsOperationComplexget = ^TVipsOperationComplexget;
  TVipsOperationComplexget =  Longint;
  Const
    VIPS_OPERATION_COMPLEXGET_REAL = 0;
    VIPS_OPERATION_COMPLEXGET_IMAG = 1;
    VIPS_OPERATION_COMPLEXGET_LAST = 2;
;

function vips_add(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_add(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_sum(in:PPVipsImage; out:PPVipsImage; n:longint; args:array of const):longint;cdecl;external;
function vips_sum(in:PPVipsImage; out:PPVipsImage; n:longint):longint;cdecl;external;
function vips_subtract(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_subtract(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_multiply(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_multiply(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_divide(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_divide(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_linear(in:PVipsImage; out:PPVipsImage; a:Pdouble; b:Pdouble; n:longint; 
           args:array of const):longint;cdecl;external;
function vips_linear(in:PVipsImage; out:PPVipsImage; a:Pdouble; b:Pdouble; n:longint):longint;cdecl;external;
function vips_linear1(in:PVipsImage; out:PPVipsImage; a:Tdouble; b:Tdouble; args:array of const):longint;cdecl;external;
function vips_linear1(in:PVipsImage; out:PPVipsImage; a:Tdouble; b:Tdouble):longint;cdecl;external;
function vips_remainder(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_remainder(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_remainder_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_remainder_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
function vips_remainder_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_remainder_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_invert(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_invert(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_abs(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_abs(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_sign(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_sign(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_round(in:PVipsImage; out:PPVipsImage; round:TVipsOperationRound; args:array of const):longint;cdecl;external;
function vips_round(in:PVipsImage; out:PPVipsImage; round:TVipsOperationRound):longint;cdecl;external;
function vips_floor(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_floor(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_ceil(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_ceil(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_rint(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_rint(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_math(in:PVipsImage; out:PPVipsImage; math:TVipsOperationMath; args:array of const):longint;cdecl;external;
function vips_math(in:PVipsImage; out:PPVipsImage; math:TVipsOperationMath):longint;cdecl;external;
function vips_sin(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_sin(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_cos(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_cos(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_tan(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_tan(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_asin(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_asin(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_acos(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_acos(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_atan(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_atan(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_exp(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_exp(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_exp10(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_exp10(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_log(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_log(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_log10(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_log10(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_sinh(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_sinh(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_cosh(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_cosh(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_tanh(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_tanh(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_asinh(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_asinh(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_acosh(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_acosh(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_atanh(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_atanh(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_complex(in:PVipsImage; out:PPVipsImage; cmplx:TVipsOperationComplex; args:array of const):longint;cdecl;external;
function vips_complex(in:PVipsImage; out:PPVipsImage; cmplx:TVipsOperationComplex):longint;cdecl;external;
function vips_polar(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_polar(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_rect(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_rect(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_conj(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_conj(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_complex2(left:PVipsImage; right:PVipsImage; out:PPVipsImage; cmplx:TVipsOperationComplex2; args:array of const):longint;cdecl;external;
function vips_complex2(left:PVipsImage; right:PVipsImage; out:PPVipsImage; cmplx:TVipsOperationComplex2):longint;cdecl;external;
function vips_cross_phase(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_cross_phase(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_complexget(in:PVipsImage; out:PPVipsImage; get:TVipsOperationComplexget; args:array of const):longint;cdecl;external;
function vips_complexget(in:PVipsImage; out:PPVipsImage; get:TVipsOperationComplexget):longint;cdecl;external;
function vips_real(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_real(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_imag(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_imag(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_complexform(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_complexform(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_relational(left:PVipsImage; right:PVipsImage; out:PPVipsImage; relational:TVipsOperationRelational; args:array of const):longint;cdecl;external;
function vips_relational(left:PVipsImage; right:PVipsImage; out:PPVipsImage; relational:TVipsOperationRelational):longint;cdecl;external;
function vips_equal(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_equal(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_notequal(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_notequal(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_less(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_less(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_lesseq(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_lesseq(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_more(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_more(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_moreeq(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_moreeq(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_relational_const(in:PVipsImage; out:PPVipsImage; relational:TVipsOperationRelational; c:Pdouble; n:longint; 
           args:array of const):longint;cdecl;external;
function vips_relational_const(in:PVipsImage; out:PPVipsImage; relational:TVipsOperationRelational; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_equal_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_equal_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_notequal_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_notequal_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_less_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_less_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_lesseq_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_lesseq_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_more_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_more_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_moreeq_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_moreeq_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
function vips_relational_const1(in:PVipsImage; out:PPVipsImage; relational:TVipsOperationRelational; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_relational_const1(in:PVipsImage; out:PPVipsImage; relational:TVipsOperationRelational; c:Tdouble):longint;cdecl;external;
function vips_equal_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_equal_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_notequal_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_notequal_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_less_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_less_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_lesseq_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_lesseq_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_more_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_more_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_moreeq_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_moreeq_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_boolean(left:PVipsImage; right:PVipsImage; out:PPVipsImage; boolean:TVipsOperationBoolean; args:array of const):longint;cdecl;external;
function vips_boolean(left:PVipsImage; right:PVipsImage; out:PPVipsImage; boolean:TVipsOperationBoolean):longint;cdecl;external;
function vips_andimage(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_andimage(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_orimage(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_orimage(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_eorimage(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_eorimage(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_lshift(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_lshift(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_rshift(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_rshift(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_boolean_const(in:PVipsImage; out:PPVipsImage; boolean:TVipsOperationBoolean; c:Pdouble; n:longint; 
           args:array of const):longint;cdecl;external;
function vips_boolean_const(in:PVipsImage; out:PPVipsImage; boolean:TVipsOperationBoolean; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_andimage_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_andimage_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_orimage_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_orimage_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_eorimage_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_eorimage_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_lshift_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_lshift_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_rshift_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_rshift_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
function vips_boolean_const1(in:PVipsImage; out:PPVipsImage; boolean:TVipsOperationBoolean; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_boolean_const1(in:PVipsImage; out:PPVipsImage; boolean:TVipsOperationBoolean; c:Tdouble):longint;cdecl;external;
function vips_andimage_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_andimage_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_orimage_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_orimage_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_eorimage_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_eorimage_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_lshift_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_lshift_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_rshift_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_rshift_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_math2(left:PVipsImage; right:PVipsImage; out:PPVipsImage; math2:TVipsOperationMath2; args:array of const):longint;cdecl;external;
function vips_math2(left:PVipsImage; right:PVipsImage; out:PPVipsImage; math2:TVipsOperationMath2):longint;cdecl;external;
function vips_pow(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_pow(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_wop(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_wop(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_atan2(left:PVipsImage; right:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_atan2(left:PVipsImage; right:PVipsImage; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_math2_const(in:PVipsImage; out:PPVipsImage; math2:TVipsOperationMath2; c:Pdouble; n:longint; 
           args:array of const):longint;cdecl;external;
function vips_math2_const(in:PVipsImage; out:PPVipsImage; math2:TVipsOperationMath2; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_pow_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_pow_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_wop_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_wop_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_atan2_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external;
function vips_atan2_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external;
function vips_math2_const1(in:PVipsImage; out:PPVipsImage; math2:TVipsOperationMath2; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_math2_const1(in:PVipsImage; out:PPVipsImage; math2:TVipsOperationMath2; c:Tdouble):longint;cdecl;external;
function vips_pow_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_pow_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_wop_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_wop_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_atan2_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external;
function vips_atan2_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external;
function vips_avg(in:PVipsImage; out:Pdouble; args:array of const):longint;cdecl;external;
function vips_avg(in:PVipsImage; out:Pdouble):longint;cdecl;external;
function vips_deviate(in:PVipsImage; out:Pdouble; args:array of const):longint;cdecl;external;
function vips_deviate(in:PVipsImage; out:Pdouble):longint;cdecl;external;
function vips_min(in:PVipsImage; out:Pdouble; args:array of const):longint;cdecl;external;
function vips_min(in:PVipsImage; out:Pdouble):longint;cdecl;external;
function vips_max(in:PVipsImage; out:Pdouble; args:array of const):longint;cdecl;external;
function vips_max(in:PVipsImage; out:Pdouble):longint;cdecl;external;
function vips_stats(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_stats(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_measure(in:PVipsImage; out:PPVipsImage; h:longint; v:longint; args:array of const):longint;cdecl;external;
function vips_measure(in:PVipsImage; out:PPVipsImage; h:longint; v:longint):longint;cdecl;external;
function vips_find_trim(in:PVipsImage; left:Plongint; top:Plongint; width:Plongint; height:Plongint; 
           args:array of const):longint;cdecl;external;
function vips_find_trim(in:PVipsImage; left:Plongint; top:Plongint; width:Plongint; height:Plongint):longint;cdecl;external;
function vips_getpoint(in:PVipsImage; vector:PPdouble; n:Plongint; x:longint; y:longint; 
           args:array of const):longint;cdecl;external;
function vips_getpoint(in:PVipsImage; vector:PPdouble; n:Plongint; x:longint; y:longint):longint;cdecl;external;
function vips_hist_find(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_hist_find(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_hist_find_ndim(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_hist_find_ndim(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_hist_find_indexed(in:PVipsImage; index:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_hist_find_indexed(in:PVipsImage; index:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_hough_line(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_hough_line(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_hough_circle(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_hough_circle(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_project(in:PVipsImage; columns:PPVipsImage; rows:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_project(in:PVipsImage; columns:PPVipsImage; rows:PPVipsImage):longint;cdecl;external;
function vips_profile(in:PVipsImage; columns:PPVipsImage; rows:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_profile(in:PVipsImage; columns:PPVipsImage; rows:PPVipsImage):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_ARITHMETIC_H }

implementation


end.
