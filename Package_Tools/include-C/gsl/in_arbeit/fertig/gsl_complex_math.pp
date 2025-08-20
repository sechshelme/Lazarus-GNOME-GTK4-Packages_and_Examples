
unit gsl_complex_math;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_complex_math.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_complex_math.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ complex/gsl_complex_math.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2004, 2007 Jorma Olavi Tähtinen, Brian Gough
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __GSL_COMPLEX_MATH_H__}
{$define __GSL_COMPLEX_MATH_H__}
{$include <gsl/gsl_inline.h>}
{$include <gsl/gsl_complex.h>}
{ Complex numbers  }

function gsl_complex_polar(r:Tdouble; theta:Tdouble):Tgsl_complex;cdecl;external;
{ r= r e^(i theta)  }
function gsl_complex_rect(x:Tdouble; y:Tdouble):Tgsl_complex;cdecl;external;
{ r= real+i*imag  }
{ was #define dname def_expr }
function GSL_COMPLEX_ONE : longint; { return type might be wrong }

{ was #define dname def_expr }
function GSL_COMPLEX_ZERO : longint; { return type might be wrong }

{ was #define dname def_expr }
function GSL_COMPLEX_NEGONE : longint; { return type might be wrong }

{ Properties of complex numbers  }
function gsl_complex_arg(z:Tgsl_complex):Tdouble;cdecl;external;
{ return arg(z), -pi< arg(z) <=+pi  }
function gsl_complex_abs(z:Tgsl_complex):Tdouble;cdecl;external;
{ return |z|    }
function gsl_complex_abs2(z:Tgsl_complex):Tdouble;cdecl;external;
{ return |z|^2  }
function gsl_complex_logabs(z:Tgsl_complex):Tdouble;cdecl;external;
{ return log|z|  }
{ Complex arithmetic operators  }
function gsl_complex_add(a:Tgsl_complex; b:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=a+b  }
function gsl_complex_sub(a:Tgsl_complex; b:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=a-b  }
function gsl_complex_mul(a:Tgsl_complex; b:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=a*b  }
function gsl_complex_div(a:Tgsl_complex; b:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=a/b  }
function gsl_complex_add_real(a:Tgsl_complex; x:Tdouble):Tgsl_complex;cdecl;external;
{ r=a+x  }
function gsl_complex_sub_real(a:Tgsl_complex; x:Tdouble):Tgsl_complex;cdecl;external;
{ r=a-x  }
function gsl_complex_mul_real(a:Tgsl_complex; x:Tdouble):Tgsl_complex;cdecl;external;
{ r=a*x  }
function gsl_complex_div_real(a:Tgsl_complex; x:Tdouble):Tgsl_complex;cdecl;external;
{ r=a/x  }
function gsl_complex_add_imag(a:Tgsl_complex; y:Tdouble):Tgsl_complex;cdecl;external;
{ r=a+iy  }
function gsl_complex_sub_imag(a:Tgsl_complex; y:Tdouble):Tgsl_complex;cdecl;external;
{ r=a-iy  }
function gsl_complex_mul_imag(a:Tgsl_complex; y:Tdouble):Tgsl_complex;cdecl;external;
{ r=a*iy  }
function gsl_complex_div_imag(a:Tgsl_complex; y:Tdouble):Tgsl_complex;cdecl;external;
{ r=a/iy  }
function gsl_complex_conjugate(z:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=conj(z)  }
function gsl_complex_inverse(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=1/a  }
function gsl_complex_negative(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=-a  }
{ Elementary Complex Functions  }
function gsl_complex_sqrt(z:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=sqrt(z)  }
function gsl_complex_sqrt_real(x:Tdouble):Tgsl_complex;cdecl;external;
{ r=sqrt(x) (x<0 ok)  }
function gsl_complex_pow(a:Tgsl_complex; b:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=a^b  }
function gsl_complex_pow_real(a:Tgsl_complex; b:Tdouble):Tgsl_complex;cdecl;external;
{ r=a^b  }
function gsl_complex_exp(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=exp(a)  }
function gsl_complex_log(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=log(a) (base e)  }
function gsl_complex_log10(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=log10(a) (base 10)  }
function gsl_complex_log_b(a:Tgsl_complex; b:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=log_b(a) (base=b)  }
{ Complex Trigonometric Functions  }
function gsl_complex_sin(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=sin(a)  }
function gsl_complex_cos(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=cos(a)  }
function gsl_complex_sec(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=sec(a)  }
function gsl_complex_csc(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=csc(a)  }
function gsl_complex_tan(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=tan(a)  }
function gsl_complex_cot(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=cot(a)  }
{ Inverse Complex Trigonometric Functions  }
function gsl_complex_arcsin(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arcsin(a)  }
function gsl_complex_arcsin_real(a:Tdouble):Tgsl_complex;cdecl;external;
{ r=arcsin(a)  }
function gsl_complex_arccos(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arccos(a)  }
function gsl_complex_arccos_real(a:Tdouble):Tgsl_complex;cdecl;external;
{ r=arccos(a)  }
function gsl_complex_arcsec(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arcsec(a)  }
function gsl_complex_arcsec_real(a:Tdouble):Tgsl_complex;cdecl;external;
{ r=arcsec(a)  }
function gsl_complex_arccsc(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arccsc(a)  }
function gsl_complex_arccsc_real(a:Tdouble):Tgsl_complex;cdecl;external;
{ r=arccsc(a)  }
function gsl_complex_arctan(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arctan(a)  }
function gsl_complex_arccot(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arccot(a)  }
{ Complex Hyperbolic Functions  }
function gsl_complex_sinh(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=sinh(a)  }
function gsl_complex_cosh(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=coshh(a)  }
function gsl_complex_sech(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=sech(a)  }
function gsl_complex_csch(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=csch(a)  }
function gsl_complex_tanh(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=tanh(a)  }
function gsl_complex_coth(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=coth(a)  }
{ Inverse Complex Hyperbolic Functions  }
function gsl_complex_arcsinh(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arcsinh(a)  }
function gsl_complex_arccosh(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arccosh(a)  }
function gsl_complex_arccosh_real(a:Tdouble):Tgsl_complex;cdecl;external;
{ r=arccosh(a)  }
function gsl_complex_arcsech(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arcsech(a)  }
function gsl_complex_arccsch(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arccsch(a)  }
function gsl_complex_arctanh(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arctanh(a)  }
function gsl_complex_arctanh_real(a:Tdouble):Tgsl_complex;cdecl;external;
{ r=arctanh(a)  }
function gsl_complex_arccoth(a:Tgsl_complex):Tgsl_complex;cdecl;external;
{ r=arccoth(a)  }
{$endif}
{ __GSL_COMPLEX_MATH_H__  }

implementation

{ was #define dname def_expr }
function GSL_COMPLEX_ONE : longint; { return type might be wrong }
  begin
    GSL_COMPLEX_ONE:=gsl_complex_rect(1.0,0.0);
  end;

{ was #define dname def_expr }
function GSL_COMPLEX_ZERO : longint; { return type might be wrong }
  begin
    GSL_COMPLEX_ZERO:=gsl_complex_rect(0.0,0.0);
  end;

{ was #define dname def_expr }
function GSL_COMPLEX_NEGONE : longint; { return type might be wrong }
  begin
    GSL_COMPLEX_NEGONE:=gsl_complex_rect(-(1.0),0.0);
  end;


end.
