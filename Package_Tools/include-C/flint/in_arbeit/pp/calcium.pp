
unit calcium;
interface

{
  Automatically converted by H2Pas 1.0.0 from calcium.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    calcium.h
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
Pcalcium_func_code  = ^calcium_func_code;
Pcalcium_stream_struct  = ^calcium_stream_struct;
Pcalcium_stream_t  = ^calcium_stream_t;
Pchar  = ^char;
PFILE  = ^FILE;
PFLINT_FILE  = ^FLINT_FILE;
Ptruth_t  = ^truth_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
    Copyright (C) 2020 Fredrik Johansson

    This file is part of Calcium.

    Calcium is free software: you can redistribute it and/or modify it under
    the terms of the GNU Lesser General Public License (LGPL) as published
    by the Free Software Foundation; either version 2.1 of the License, or
    (at your option) any later version.  See <http://www.gnu.org/licenses/>.
 }
{$ifndef CALCIUM_H}
{$define CALCIUM_H}
{ Global library definitions  }
(* Const before type ignored *)

function calcium_version:Pchar;cdecl;external;
const
  __CALCIUM_VERSION = 0;  
  __CALCIUM_VERSION_MINOR = 4;  
  __CALCIUM_VERSION_PATCHLEVEL = 1;  
  CALCIUM_VERSION = '0.4.0';  
{xxxxxxxxxx
#define __CALCIUM_RELEASE (__CALCIUM_VERSION * 10000 + \
                         __CALCIUM_VERSION_MINOR * 100 + \
                         __CALCIUM_VERSION_PATCHLEVEL)
 }
{ Input and output  }
type
  Pcalcium_stream_struct = ^Tcalcium_stream_struct;
  Tcalcium_stream_struct = record
      fp : PFLINT_FILE;
      s : Pchar;
      len : Tslong;
      alloc : Tslong;
    end;

  Pcalcium_stream_t = ^Tcalcium_stream_t;
  Tcalcium_stream_t = array[0..0] of Tcalcium_stream_struct;
{$ifdef FLINT_HAVE_FILE}

procedure calcium_stream_init_file(out:Tcalcium_stream_t; fp:PFILE);cdecl;external;
{$endif}
{xxxxxxxxx
CALCIUM_INLINE
void calcium_stream_init_str(calcium_stream_t out)

    out->fp = NULL;
    out->s = (char *) flint_malloc(16);
    out->s[0] = '\0';
    out->len = 0;
    out->alloc = 16;

 }
(* Const before type ignored *)

procedure calcium_write(out:Tcalcium_stream_t; s:Pchar);cdecl;external;
procedure calcium_write_si(out:Tcalcium_stream_t; x:Tslong);cdecl;external;
(* Const before type ignored *)
procedure calcium_write_fmpz(out:Tcalcium_stream_t; c:Tfmpz_t);cdecl;external;
(* Const before type ignored *)
procedure calcium_write_acb(out:Tcalcium_stream_t; z:Tacb_t; digits:Tslong; flags:Tulong);cdecl;external;
{xxxxxxxxx
CALCIUM_INLINE
void calcium_write_free(calcium_stream_t out, char * s)

    calcium_write(out, s);
    flint_free(s);
 }
type
  Ptruth_t = ^Ttruth_t;
  Ttruth_t =  Longint;
  Const
    T_TRUE = 0;
    T_FALSE = 1;
    T_UNKNOWN = 2;
;
{xxxxxxxxx
CALCIUM_INLINE void truth_print(truth_t t)

    if (t == T_TRUE) flint_printf("T_TRUE");
    if (t == T_FALSE) flint_printf("T_FALSE");
    if (t == T_UNKNOWN) flint_printf("T_UNKNOWN");

 }
{ Special case for representing qqbar instances  }
{ Arithmetic  }
{ Roots  }
{ Complex parts  }
{ Elementary constants  }
{ Elementary functions  }
{ Euler's constant  }
{ Gamma and related functions  }
type
  Pcalcium_func_code = ^Tcalcium_func_code;
  Tcalcium_func_code =  Longint;
  Const
    CA_QQBar = 0;
    CA_Neg = 1;
    CA_Add = 2;
    CA_Sub = 3;
    CA_Mul = 4;
    CA_Div = 5;
    CA_Sqrt = 6;
    CA_Cbrt = 7;
    CA_Root = 8;
    CA_Floor = 9;
    CA_Ceil = 10;
    CA_Abs = 11;
    CA_Sign = 12;
    CA_Re = 13;
    CA_Im = 14;
    CA_Arg = 15;
    CA_Conjugate = 16;
    CA_Pi = 17;
    CA_Sin = 18;
    CA_Cos = 19;
    CA_Exp = 20;
    CA_Log = 21;
    CA_Pow = 22;
    CA_Tan = 23;
    CA_Cot = 24;
    CA_Cosh = 25;
    CA_Sinh = 26;
    CA_Tanh = 27;
    CA_Coth = 28;
    CA_Atan = 29;
    CA_Acos = 30;
    CA_Asin = 31;
    CA_Acot = 32;
    CA_Atanh = 33;
    CA_Acosh = 34;
    CA_Asinh = 35;
    CA_Acoth = 36;
    CA_Euler = 37;
    CA_Gamma = 38;
    CA_LogGamma = 39;
    CA_Psi = 40;
    CA_Erf = 41;
    CA_Erfc = 42;
    CA_Erfi = 43;
    CA_RiemannZeta = 44;
    CA_HurwitzZeta = 45;
    CA_FUNC_CODE_LENGTH = 46;
;
(* Const before type ignored *)

function calcium_func_name(func:Tcalcium_func_code):Pchar;cdecl;external;
{xxxxxxxxxxxxx
CALCIUM_INLINE ulong calcium_fmpz_hash(const fmpz_t x)

    if (!COEFF_IS_MPZ(*x))
        return *x;
    else
    
        __mpz_struct * z = COEFF_TO_PTR(*x);
        return (z->_mp_size > 0) ? z->_mp_d[0] : -z->_mp_d[0];
    


 }

implementation


end.
