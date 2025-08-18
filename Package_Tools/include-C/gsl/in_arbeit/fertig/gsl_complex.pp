
unit gsl_complex;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_complex.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_complex.h
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
    Pgsl_complex_packed  = ^gsl_complex_packed;
    Pgsl_complex_packed_array  = ^gsl_complex_packed_array;
    Pgsl_complex_packed_array_float  = ^gsl_complex_packed_array_float;
    Pgsl_complex_packed_array_long_double  = ^gsl_complex_packed_array_long_double;
    Pgsl_complex_packed_float  = ^gsl_complex_packed_float;
    Pgsl_complex_packed_float_ptr  = ^gsl_complex_packed_float_ptr;
    Pgsl_complex_packed_long_double  = ^gsl_complex_packed_long_double;
    Pgsl_complex_packed_long_double_ptr  = ^gsl_complex_packed_long_double_ptr;
    Pgsl_complex_packed_ptr  = ^gsl_complex_packed_ptr;
    Pgsl_const_complex_packed  = ^gsl_const_complex_packed;
    Pgsl_const_complex_packed_array  = ^gsl_const_complex_packed_array;
    Pgsl_const_complex_packed_array_float  = ^gsl_const_complex_packed_array_float;
    Pgsl_const_complex_packed_array_long_double  = ^gsl_const_complex_packed_array_long_double;
    Pgsl_const_complex_packed_float  = ^gsl_const_complex_packed_float;
    Pgsl_const_complex_packed_float_ptr  = ^gsl_const_complex_packed_float_ptr;
    Pgsl_const_complex_packed_long_double  = ^gsl_const_complex_packed_long_double;
    Pgsl_const_complex_packed_long_double_ptr  = ^gsl_const_complex_packed_long_double_ptr;
    Pgsl_const_complex_packed_ptr  = ^gsl_const_complex_packed_ptr;
    Plong_double  = ^long_double;
    Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


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
(* Const before type ignored *)

  Pgsl_const_complex_packed = ^Tgsl_const_complex_packed;
  Tgsl_const_complex_packed = Pdouble;
(* Const before type ignored *)

  Pgsl_const_complex_packed_float = ^Tgsl_const_complex_packed_float;
  Tgsl_const_complex_packed_float = Psingle;
(* Const before type ignored *)

  Pgsl_const_complex_packed_long_double = ^Tgsl_const_complex_packed_long_double;
  Tgsl_const_complex_packed_long_double = Plong_double;
{ 2N consecutive built-in types as N complex numbers  }

  Pgsl_complex_packed_array = ^Tgsl_complex_packed_array;
  Tgsl_complex_packed_array = Pdouble;

  Pgsl_complex_packed_array_float = ^Tgsl_complex_packed_array_float;
  Tgsl_complex_packed_array_float = Psingle;

  Pgsl_complex_packed_array_long_double = ^Tgsl_complex_packed_array_long_double;
  Tgsl_complex_packed_array_long_double = Plong_double;
(* Const before type ignored *)

  Pgsl_const_complex_packed_array = ^Tgsl_const_complex_packed_array;
  Tgsl_const_complex_packed_array = Pdouble;
(* Const before type ignored *)

  Pgsl_const_complex_packed_array_float = ^Tgsl_const_complex_packed_array_float;
  Tgsl_const_complex_packed_array_float = Psingle;
(* Const before type ignored *)

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
(* Const before type ignored *)

  Pgsl_const_complex_packed_ptr = ^Tgsl_const_complex_packed_ptr;
  Tgsl_const_complex_packed_ptr = Pdouble;
(* Const before type ignored *)

  Pgsl_const_complex_packed_float_ptr = ^Tgsl_const_complex_packed_float_ptr;
  Tgsl_const_complex_packed_float_ptr = Psingle;
(* Const before type ignored *)

  Pgsl_const_complex_packed_long_double_ptr = ^Tgsl_const_complex_packed_long_double_ptr;
  Tgsl_const_complex_packed_long_double_ptr = Plong_double;
{
 * If <complex.h> is included, use the C99 complex type.  Otherwise
 * define a type bit-compatible with C99 complex. The GSL_REAL and GSL_IMAG
 * macros require C11 functionality also (_Generic)
  }
{ older gcc compilers claim to be C11 compliant but do not support _Generic  }
{$if defined(__GNUC__) && (__GNUC__ < 7)}

const
  GSL_COMPLEX_LEGACY = 1;  
{$endif}
{$if !defined(GSL_COMPLEX_LEGACY) &&          \}
(* error 
     defined(_Complex_I) &&                  \
{ C11  }
(* error 
#  define GSL_COMPLEX_DEFINE(R, C) typedef R _Complex C ;
 in declarator_list *)
 in declarator_list *)
(* error 
#  define GSL_COMPLEX_DEFINE(R, C) typedef R _Complex C ;
in define line 73 *)
    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   

    function GSL_COMPLEX_P(zp : longint) : longint;    

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_EQ(z1,z2 : longint) : longint;    

(* error 
#  define GSL_SET_COMPLEX(zp,x,y)  (*(zp) = (x) + I * (y))
in define line 77 *)
(* error 
                                     complex float       : ((float *) &(z)),  \
in define line 82 *)
(* error 
                                     complex float       : ((float *) &(z)),  \
in define line 87 *)
(* error 
#  define GSL_COMPLEX_P_REAL(zp)   GSL_REAL(*(zp))
in define line 89 *)
(* error 
#  define GSL_COMPLEX_P_IMAG(zp)   GSL_IMAG(*(zp))
in define line 90 *)
(* error 
#  define GSL_SET_REAL(zp,x)       do { GSL_REAL(*(zp)) = (x); } while(0)
in declaration at line 91 *)
(* error 
#  define GSL_SET_REAL(zp,x)       do { GSL_REAL(*(zp)) = (x); } while(0)
in declaration at line 92 *)
(* error 
#  define GSL_SET_IMAG(zp,x)       do { GSL_IMAG(*(zp)) = (x); } while(0)
{$else}
    { legacy complex definitions  }
    {
     * According to the C17 standard, 6.2.5 paragraph 13:
     *
     * "Each complex type has the same representation and alignment requirements
     * as an array type containing exactly two elements of the corresponding real
     * type; the first element is equal to the real part, and the second element to
     * the imaginary part, of the complex number."
      }
    {#  define GSL_COMPLEX_DEFINE(R, C) typedef R C[2] }
in declaration at line 106 *)
(* error 
#  define GSL_COMPLEX_DEFINE(R, C) typedef struct { R dat[2]; } C ;
in declaration at line 106 *)
    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   

    function GSL_REAL(z : longint) : longint;    

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_IMAG(z : longint) : longint;    

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_P(zp : longint) : longint;    

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_P_REAL(zp : longint) : longint;    

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_P_IMAG(zp : longint) : longint;    

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_EQ(z1,z2 : longint) : longint;    

(* error 
#  define GSL_SET_COMPLEX(zp,x,y)  do {(zp)->dat[0]=(x); (zp)->dat[1]=(y);} while(0)
in declaration at line 115 *)
(* error 
#  define GSL_SET_COMPLEX(zp,x,y)  do {(zp)->dat[0]=(x); (zp)->dat[1]=(y);} while(0)
in declaration at line 115 *)
(* error 
#  define GSL_SET_COMPLEX(zp,x,y)  do {(zp)->dat[0]=(x); (zp)->dat[1]=(y);} while(0)
in declaration at line 116 *)
(* error 
#  define GSL_SET_REAL(zp,x)       do {(zp)->dat[0]=(x);} while(0)
in declaration at line 117 *)
(* error 
#  define GSL_SET_IMAG(zp,y)       do {(zp)->dat[1]=(y);} while(0)
{$endif}
in declaration at line 125 *)
(* error 
#define GSL_SET_COMPLEX_PACKED(zp,n,x,y) do {*((zp)+2*(n))=(x); *((zp)+(2*(n)+1))=(y);} while(0)
in declaration at line 125 *)
(* error 
#define GSL_SET_COMPLEX_PACKED(zp,n,x,y) do {*((zp)+2*(n))=(x); *((zp)+(2*(n)+1))=(y);} while(0)
{$endif}
    { __GSL_COMPLEX_H__  }

implementation

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_P(zp : longint) : longint;
    begin
      GSL_COMPLEX_P:=@(zp);
    end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_EQ(z1,z2 : longint) : longint;
    begin
      GSL_COMPLEX_EQ:=z1=z2;
    end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_REAL(z : longint) : longint;
    begin
      GSL_REAL:=z.(dat[0]);
    end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_IMAG(z : longint) : longint;
    begin
      GSL_IMAG:=z.(dat[1]);
    end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_P(zp : longint) : longint;
    begin
      GSL_COMPLEX_P:=zp^.dat;
    end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_P_REAL(zp : longint) : longint;
    begin
      GSL_COMPLEX_P_REAL:=zp^.(dat[0]);
    end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_P_IMAG(zp : longint) : longint;
    begin
      GSL_COMPLEX_P_IMAG:=zp^.(dat[1]);
    end;

    { was #define dname(params) para_def_expr }
    { argument types are unknown }
    { return type might be wrong }   
    function GSL_COMPLEX_EQ(z1,z2 : longint) : longint;
    begin
      GSL_COMPLEX_EQ:=((z1.(dat[0]))=(z2.(dat[0]))) and (@((z1.(dat[1]))=(z2.(dat[1]))));
    end;


end.
