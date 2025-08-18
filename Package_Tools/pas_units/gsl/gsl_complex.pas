unit gsl_complex;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type // ?????????????????
  Tgsl_complex = record
    f1, f2: Double;
  end;
  Pgsl_complex=^Tgsl_complex;

  Tgsl_complex_float = record
    f1, f2: single;
  end;
  Pgsl_complex_float=^Tgsl_complex_float;


{ complex/gsl_complex.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000, 2007 Gerard Jungman, Brian Gough
 * Copyright (C) 2020, 2021 Patrick Alken
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
  { two consecutive built-in types as a complex number  }
type
  Pgsl_complex_packed = ^Tgsl_complex_packed;
  Tgsl_complex_packed = Pdouble;

  Pgsl_complex_packed_float = ^Tgsl_complex_packed_float;
  Tgsl_complex_packed_float = Psingle;

  Pgsl_complex_packed_long_double = ^Tgsl_complex_packed_long_double;
  Tgsl_complex_packed_long_double = Plong_double;

  Pgsl_const_complex_packed = ^Tgsl_const_complex_packed;
  Tgsl_const_complex_packed = Pdouble;

  Pgsl_const_complex_packed_float = ^Tgsl_const_complex_packed_float;
  Tgsl_const_complex_packed_float = Psingle;

  Pgsl_const_complex_packed_long_double = ^Tgsl_const_complex_packed_long_double;
  Tgsl_const_complex_packed_long_double = Plong_double;
  { 2N consecutive built-in types as N complex numbers  }

  Pgsl_complex_packed_array = ^Tgsl_complex_packed_array;
  Tgsl_complex_packed_array = Pdouble;

  Pgsl_complex_packed_array_float = ^Tgsl_complex_packed_array_float;
  Tgsl_complex_packed_array_float = Psingle;

  Pgsl_complex_packed_array_long_double = ^Tgsl_complex_packed_array_long_double;
  Tgsl_complex_packed_array_long_double = Plong_double;

  Pgsl_const_complex_packed_array = ^Tgsl_const_complex_packed_array;
  Tgsl_const_complex_packed_array = Pdouble;

  Pgsl_const_complex_packed_array_float = ^Tgsl_const_complex_packed_array_float;
  Tgsl_const_complex_packed_array_float = Psingle;

  Pgsl_const_complex_packed_array_long_double = ^Tgsl_const_complex_packed_array_long_double;
  Tgsl_const_complex_packed_array_long_double = Plong_double;
{ Yes... this seems weird. Trust us. The point is just that
   sometimes you want to make it obvious that something is
   an output value. The fact that it lacks a 'const' may not
   be enough of a clue for people in some contexts.
  }

  Pgsl_complex_packed_ptr = ^Tgsl_complex_packed_ptr;
  Tgsl_complex_packed_ptr = Pdouble;

  Pgsl_complex_packed_float_ptr = ^Tgsl_complex_packed_float_ptr;
  Tgsl_complex_packed_float_ptr = Psingle;

  Pgsl_complex_packed_long_double_ptr = ^Tgsl_complex_packed_long_double_ptr;
  Tgsl_complex_packed_long_double_ptr = Plong_double;

  Pgsl_const_complex_packed_ptr = ^Tgsl_const_complex_packed_ptr;
  Tgsl_const_complex_packed_ptr = Pdouble;

  Pgsl_const_complex_packed_float_ptr = ^Tgsl_const_complex_packed_float_ptr;
  Tgsl_const_complex_packed_float_ptr = Psingle;

  Pgsl_const_complex_packed_long_double_ptr = ^Tgsl_const_complex_packed_long_double_ptr;
  Tgsl_const_complex_packed_long_double_ptr = Plong_double;
{
 * If <complex.h> is included, use the C99 complex type.  Otherwise
 * define a type bit-compatible with C99 complex. The GSL_REAL and GSL_IMAG
 * macros require C11 functionality also (_Generic)
  }


  ///* older gcc compilers claim to be C11 compliant but do not support _Generic */
  //#if defined(__GNUC__) && (__GNUC__ < 7)
  //#  define GSL_COMPLEX_LEGACY 1
  //#endif
  //
  //#if !defined(GSL_COMPLEX_LEGACY) &&          \
  //     defined(_Complex_I) &&                  \
  //     defined(complex) &&                     \
  //     defined(I) &&                           \
  //     defined(__STDC__) && (__STDC__ == 1) && \
  //     defined(__STDC_VERSION__) && (__STDC_VERSION__ >= 201112L) /* C11 */
  //
  //#  define GSL_COMPLEX_DEFINE(R, C) typedef R _Complex C ;
  //
  //#  define GSL_COMPLEX_P(zp)        (&(zp))
  //#  define GSL_COMPLEX_EQ(z1,z2)    ((z1) == (z2))
  //#  define GSL_SET_COMPLEX(zp,x,y)  (*(zp) = (x) + I * (y))
  //
  //#  define GSL_REAL(z)              (_Generic((z),                             \
  //                                     complex float       : ((float *) &(z)),  \
  //                                     complex double      : ((double *) &(z)), \
  //                                     complex long double : ((long double *) &(z)))[0])
  //
  //#  define GSL_IMAG(z)              (_Generic((z),                             \
  //                                     complex float       : ((float *) &(z)),  \
  //                                     complex double      : ((double *) &(z)), \
  //                                     complex long double : ((long double *) &(z)))[1])
  //
  //#  define GSL_COMPLEX_P_REAL(zp)   GSL_REAL(*(zp))
  //#  define GSL_COMPLEX_P_IMAG(zp)   GSL_IMAG(*(zp))
  //#  define GSL_SET_REAL(zp,x)       do { GSL_REAL(*(zp)) = (x); } while(0)
  //#  define GSL_SET_IMAG(zp,x)       do { GSL_IMAG(*(zp)) = (x); } while(0)
  //
  //#else /* legacy complex definitions */
  //
  ///*
  // * According to the C17 standard, 6.2.5 paragraph 13:
  // *
  // * "Each complex type has the same representation and alignment requirements
  // * as an array type containing exactly two elements of the corresponding real
  // * type; the first element is equal to the real part, and the second element to
  // * the imaginary part, of the complex number."
  // */
  //
  ///*#  define GSL_COMPLEX_DEFINE(R, C) typedef R C[2]*/
  //#  define GSL_COMPLEX_DEFINE(R, C) typedef struct { R dat[2]; } C ;
  //
  //#  define GSL_REAL(z)              ((z).dat[0])
  //#  define GSL_IMAG(z)              ((z).dat[1])
  //#  define GSL_COMPLEX_P(zp)        ((zp)->dat)
  //#  define GSL_COMPLEX_P_REAL(zp)   ((zp)->dat[0])
  //#  define GSL_COMPLEX_P_IMAG(zp)   ((zp)->dat[1])
  //#  define GSL_COMPLEX_EQ(z1,z2)    (((z1).dat[0] == (z2).dat[0]) && ((z1).dat[1] == (z2).dat[1]))
  //
  //#  define GSL_SET_COMPLEX(zp,x,y)  do {(zp)->dat[0]=(x); (zp)->dat[1]=(y);} while(0)
  //#  define GSL_SET_REAL(zp,x)       do {(zp)->dat[0]=(x);} while(0)
  //#  define GSL_SET_IMAG(zp,y)       do {(zp)->dat[1]=(y);} while(0)
  //
  //#endif
  //
  //GSL_COMPLEX_DEFINE(double, gsl_complex)
  //GSL_COMPLEX_DEFINE(long double, gsl_complex_long_double)
  //GSL_COMPLEX_DEFINE(float, gsl_complex_float)
  //
  //#define GSL_SET_COMPLEX_PACKED(zp,n,x,y) do {*((zp)+2*(n))=(x); *((zp)+(2*(n)+1))=(y);} while(0)


implementation


end.
